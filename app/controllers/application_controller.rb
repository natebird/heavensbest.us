class ApplicationController < ActionController::Base
  include HoptoadNotifier::Catcher

  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation, :creditcard

  helper :all # include all helpers, all the time
  helper_method :current_account, :admin?, :current_user_session, :current_user

  # rescue_from(ActiveRecord::RecordNotFound) { |e| render :file => 'errors/404', :status => :not_found }
  # rescue_from(NoMethodError) { |e| render :file => 'errors/404', :status => :not_found }  
  
  protected
    def not_authorized
      store_location
      render :file => 'errors/404', :status => 404
    end

  private
    def current_account # Find the current_account
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
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

end

