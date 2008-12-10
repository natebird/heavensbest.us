class ServicesController < ApplicationController

  def index
    @services = current_account.services.find(:all)
    @region = @account.region.abbreviation.downcase
    redirect_to service_path(@region, @account.name.downcase, @services.first.title)
  end


  def show
    @service = current_account.services.find_by_title(params[:id])
    @services = current_account.services.find(:all)
  end

end
