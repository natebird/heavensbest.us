class TestimonialsController < ApplicationController

  def index
    @testimonials = current_account.testimonials.find(:all, :conditions => [ "active = ?", true ] )
    @services = @account.services.find(:all)
    @current_tab = "testimonials"
  end


  def show
    @testimonial = current_account.testimonials.find(params[:id])
    @services = @account.services.find(:all)
    rescue
      redirect_to root_path
      flash[:notice] = "No areas found"
  end

end
