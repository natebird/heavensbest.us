class SpecialsController < ApplicationController
  # layout "print", :except => :index
  
  def index
    @specials = current_account.specials.find(:all, :conditions => [ "start <= ? and end >= ?", Date.today, Date.today ] )
    redirect_to_external unless @account.externalsite.blank?
    @testimonial ||= current_account.testimonials.find(:first, :order => APP_CONFIG[:random_query])
    @services = @account.services.all
    @current_tab = "specials"
    rescue
      redirect_to root_path
      flash[:notice] = "Area not found"
  end


  def show
    @special = current_account.specials.find(params[:id])
    redirect_to_external unless @account.externalsite.blank?
    render :partial => 'special'
  end

  private
  
  def redirect_to_external
    redirect_to @account.externalsite, :status=>301
  end

end
