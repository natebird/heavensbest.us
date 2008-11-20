class ServicesController < ApplicationController

  def index
    @services = current_account.services.find(:all)
  end


  def show
    @service = current_account.services.find(params[:id])
    @services = current_account.services.find(:all)
  end

end
