class Admin::UsersController < ApplicationController
  before_filter :admin_only, :except => [:edit, :activate]
  skip_before_filter :verify_authenticity_token, :only => :create
  include ModelControllerMethods
  layout "operator"
     
  def new
    @user = User.new
    @users = User.find(:all, :conditions => [ "state = ?", "pending" ] )
  end
 
  def edit
    @user = current_user if !current_user.has_role?('admin')
    @user = User.find(params[:id]) if current_user.has_role?('admin')
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated service."
      redirect_to :action => 'edit'
    else
      render :action => 'edit'
    end
  end
  
  def create
    # logout_keeping_session!
    if using_open_id?
      authenticate_with_open_id(params[:openid_url], :return_to => open_id_create_url, 
        :required => [:nickname, :email]) do |result, identity_url, registration|
        if result.successful?
          create_new_user(:identity_url => identity_url, :login => registration['nickname'], :email => registration['email'])
        else
          failed_creation(result.message || "Sorry, something went wrong")
        end
      end
    else
      create_new_user(params[:user])
    end
  end
  
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.populate_defaults
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to login_path
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default(root_path)
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default(root_path)
    end
  end
  
  protected
  
  def create_new_user(attributes)
    @user = User.new(attributes)
    if @user && @user.valid?
      if @user.not_using_openid?
        @user.register!
      else
        @user.register_openid!
      end
    end
    
    if @user.errors.empty?
      successful_creation(@user)
    else
      failed_creation
    end
  end
  
  def successful_creation(user)
    redirect_to new_admin_user_url
    flash[:notice] = "Thanks for signing up!"
    flash[:notice] << " We're sending you an email with your activation code." if @user.not_using_openid?
    flash[:notice] << " You can now login with your OpenID." unless @user.not_using_openid?
  end
  
  def failed_creation(message = 'Sorry, there was an error creating your account')
    flash[:error] = message
    render :action => :new
  end
  
  def populate_defaults(user)
    rake db:populate
  end
end
