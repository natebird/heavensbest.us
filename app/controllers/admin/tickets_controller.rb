class Admin::TicketsController < Operator::ApplicationController
  layout "operator"
  include ModelControllerMethods
  before_filter :admin_only
    
  def new
    @accounts = Account.find(:all)
  end
  
  def edit
    @accounts = Account.find(:all)
  end
  
end
