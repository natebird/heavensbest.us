class ServicesController < ApplicationController

  def index
    @services = current_account.services.find(:all, :conditions => [ "active = ?", true ] )
    @region = @account.region.abbreviation.downcase
    redirect_to service_path(@region, @account.accountlink, @services.first.servicelink)
  end


  def show
    @service = current_account.services.find_by_servicelink(params[:id])
    @services = current_account.services.find(:all, :conditions => [ "active = ?", true ] )
  end

end
