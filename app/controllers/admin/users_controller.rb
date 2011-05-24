class Admin::UsersController < InheritedResources::Base
  before_filter :admin?, :except => :edit
  skip_before_filter :verify_authenticity_token, :only => :create
  layout "operator"

  def index
    @users = User.where("state = ?", "active")
    @inactive_users = User.where("state = ?", "pending")
  end
    
  def new
    @user = User.new
  end
 
  def edit
    if admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
  
  def update
    @user = current_user if !admin?
    @user = User.find(params[:id]) if admin?

    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile"
      if admin?
        redirect_to edit_admin_user_path(params[:id])
      else
        redirect_to edit_admin_user_path(current_user)
      end
    else
      render :action => 'edit'
    end
  end
    
end
