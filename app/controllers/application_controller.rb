class ApplicationController < ActionController::Base
  protect_from_forgery
  

  private  
    def current_user  
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]  
    end
    helper_method :current_user
    
    def user_signed_in?
      return 1 if current_user 
    end
    helper_method :user_signed_in?
      
    def authenticate_user!
      if !current_user
        flash[:error] = 'You need to sign in before accessing this page!'
        redirect_to signin_services_path
      end
    end    

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

    def admin?
      current_user.has_role?('admin')
      rescue 
        flash[:notice] = "You are not authorized to access that area"
        redirect_to login_path
    end
    helper_method :admin?

end

