class ApplicationController < ActionController::Base
  include ExceptionNotifiable
  include AuthenticatedSystem
  include RoleRequirementSystem
  include SslRequirement

  helper :all # include all helpers, all the time
  helper_method :current_account, :admin_only

  protect_from_forgery :secret => 'b0a876313f3f9195e9bd01473bc5cd06'
  filter_parameter_logging :password, :password_confirmation, :creditcard
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  protected
  
  # Automatically respond with 404 for ActiveRecord::RecordNotFound
  def record_not_found
    render :file => File.join(RAILS_ROOT, 'public', '404.html'), :status => 404
  end

  # Find the current_account
  def current_account
    if params[:account]
      @account = Account.find_by_name(params[:account].titlecase)
    else
      if params[:account_id]
        @account = Account.find(params[:account_id])
      else
        @account = current_user.accounts.find(:first)
        raise ActiveRecord::RecordNotFound unless @accounts
      end
    end
  end

  def admin_only
    current_user.has_role?('admin')
  end

  def not_authorized
    store_location
    render :file => File.join(RAILS_ROOT, 'public', '404.html'), :status => 404
  end

end

