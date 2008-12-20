class Admin::TicketsController < ApplicationController
  layout "operator"
  include ModelControllerMethods
  before_filter :admin_only
    
  def index
    @tickets = Ticket.find(:all)
  end

  def new
    @accounts = Account.find(:all, :order => 'name asc')
  end
  
  def edit
    @accounts = Account.find(:all, :order => 'name asc')
  end
  
end
