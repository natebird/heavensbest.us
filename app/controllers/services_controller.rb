class ServicesController < ApplicationController

  def index
    @services = current_account.services.find(:all)
    redirect_to account_service_path(@account, @services.first.title)
  end


  def show
    @service = current_account.services.find_by_title(params[:id])
    @services = current_account.services.find(:all)
  end

end
