class Admin::UsersController < ApplicationController
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
      
    def authorized?
      self.action_name == 'index' || current_user.has_role?('admin')
    end
    
end
