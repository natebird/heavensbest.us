class TicketsController < ApplicationController
  include ModelControllerMethods

  def new
    @accounts = Account.find(:all)
    # render :layout => 'public' # Uncomment if your "public" site has a different layout than the one used for logged-in users
  end
  
  def create
    @accounts = Account.find(:all)
    
    if @ticket.save
      flash[:notice] = "Your request has been received. We will contact you shortly if necessary."
      redirect_to :action => "new"
    else
      render :action => 'new'#, :layout => 'public' # Uncomment if your "public" site has a different layout than the one used for logged-in users
    end
  end

end