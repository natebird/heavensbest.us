class TestimonialsController < ApplicationController

  def index
    @testimonials = current_account.testimonials.find(:all, :conditions => [ "active = ?", true ] )
  end


  def show
    @testimonial = current_account.testimonials.find(params[:id])
  end

end
