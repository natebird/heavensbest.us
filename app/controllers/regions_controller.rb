class RegionsController < ApplicationController

  def show
    @region = Region.find_by_abbreviation(params[:region].upcase)
    @accounts ||= Account.find(:all, :conditions => ['region_id = ?', "#{@region.id}"])
  end

  def region_search
    @account = Account.find_by_name(params[:account][:locations])
    redirect_to area_path(@account.region.abbreviation.downcase, @account.accountlink)
  rescue
    flash[:notice] = "Area not found"    
    render :action => :index, :status => :not_found  
  end  

end
