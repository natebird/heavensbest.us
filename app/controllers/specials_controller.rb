class SpecialsController < ApplicationController
  # layout "print", :except => :index
  
  def index
    @specials = current_account.specials.find(:all, :conditions => [ "start <= ? and end >= ?", Date.today, Date.today ] )
    @testimonial ||= current_account.testimonials.find(:first, :order => APP_CONFIG[:random_query])
    @services = @account.services.find(:all)
    rescue
      redirect_to area_path(@account.region.abbreviation.downcase, @account.accountlink)
      flash[:notice] = "No services found"
  end


  def show
    @special = current_account.specials.find(params[:id])
    render :partial => 'special'
  end

end
