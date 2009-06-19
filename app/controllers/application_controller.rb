class ApplicationController < ActionController::Base
  include HoptoadNotifier::Catcher
  include AuthenticatedSystem
  include RoleRequirementSystem
  include SslRequirement

  helper :all # include all helpers, all the time
  helper_method :current_account, :admin?

  protect_from_forgery :secret => 'b0a876313f3f9195e9bd01473bc5cd06'
  filter_parameter_logging :password, :password_confirmation, :creditcard
  rescue_from(ActiveRecord::RecordNotFound) { |e| render :file => 'errors/404', :status => :not_found }
  # rescue_from(NoMethodError) { |e| render :file => 'errors/404', :status => :not_found }
  
  
  protected

  # Find the current_account
  def current_account
    if params[:accountlink]
      @account = Account.find_by_accountlink(params[:accountlink])
    else
      if params[:account_id]
        @account = Account.find(params[:account_id])
      else
        @account = current_user.accounts.find(:first)
        raise ActiveRecord::RecordNotFound unless @accounts
      end
    end
  end

  def admin?
    current_user.has_role?('admin')
    rescue 
      flash[:notice] = "You are not authorized to access that area"
      redirect_to login_path
  end

  def not_authorized
    store_location
    render :file => 'errors/404', :status => 404
  end

end

