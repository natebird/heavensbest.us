class Admin::TicketsController < Operator::ApplicationController
  layout "operator"
  include ModelControllerMethods
  
  def index
    @tickets = Ticket.find(:all)
  end
  
  def new
    @accounts = Account.find(:all)
  end
  
  def edit
    @accounts = Account.find(:all)
  end
  
end
