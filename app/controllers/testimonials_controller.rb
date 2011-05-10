class TestimonialsController < ApplicationController

  def index
    @testimonials = current_account.testimonials.where("active = ?", true)
    redirect_to_external unless @account.externalsite.blank?
    @services = @account.services.all
    @current_tab = "testimonials"
  end


  def show
    @testimonial = current_account.testimonials.find(params[:id])
    redirect_to_external unless @account.externalsite.blank?
    @services = @account.services.all
    rescue
      redirect_to root_path
      flash[:notice] = "No areas found"
  end

  private
  
  def redirect_to_external
    redirect_to @account.externalsite, :status=>301
  end

end
