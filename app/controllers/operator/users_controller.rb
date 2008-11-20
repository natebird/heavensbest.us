class Operator::UsersController < Operator::ApplicationController
  layout "operator"
  include ModelControllerMethods


  def create
    if @user.save
      redirect_to operator_users_url
    else
      render :action => 'new'
    end
  end
  
  protected
  
    def scoper
      current_client.users
    end
    
    def authorized?
      self.action_name == 'index' || admin?
    end
    
end
