class TicketsController < ApplicationController
  layout "operator"
  include ModelControllerMethods

  def new
    @accounts = Account.find(:all)
  end
  
  def create
    @accounts = Account.find(:all)
    
    if @ticket.save
      flash[:notice] = "Your request has been received. We will contact you shortly if necessary."
      redirect_to :action => "new"
    else
      render :action => 'new'
    end
  end

end