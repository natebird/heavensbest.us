class ApplicationController < ActionController::Base
  protect_from_forgery

  # Simple admin role
  def admin?
    current_user.has_role?('admin')
    rescue 
      flash[:notice] = "You are not authorized to access that area"
      redirect_to new_user_session_path
  end
  helper_method :admin?

  protected  

    # Find the current_account
    def current_account
      if params[:accountlink]
        @account = Account.find_by_accountlink(params[:accountlink])
      else
        if params[:account_id]
          @account = Account.find(params[:account_id])
        else
          @account = current_user.accounts.first
          raise ActiveRecord::RecordNotFound unless @accounts
        end
      end
    end
    helper_method :current_account

    def after_sign_in_path_for(resource_or_scope)
       operator_accounts_path
    end
end
