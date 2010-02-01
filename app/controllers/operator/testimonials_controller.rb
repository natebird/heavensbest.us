class Operator::TestimonialsController < ApplicationController
  layout "operator"
  before_filter :require_user
  before_filter :current_account

  before_filter :set_current_tab
    def set_current_tab
      @current_tab = "testimonials"
    end

  def index
    @testimonials = @account.testimonials.find(:all)
  end


  def show
    @testimonial = @account.testimonials.find(params[:id])
  end


  def new
    @testimonial = @account.testimonials.new 
    @testimonials = @account.testimonials.find(:all)
  end


  def edit
    @testimonial = @account.testimonials.find(params[:id])
    @testimonials = @account.testimonials.find(:all)
  end


  def create
    @testimonials = @account.testimonials.find(:all)
    @testimonial = @account.testimonials.new(params[:testimonial])

    if @testimonial.save
      flash[:notice] = 'Testimonial was successfully created.'
      redirect_to edit_operator_account_testimonial_url(@account, @testimonial)
    else
      render :action => "new"
    end
  end


  def update
    @testimonial = @account.testimonials.find(params[:id])

    if @testimonial.update_attributes(params[:testimonial])
      flash[:notice] = 'Testimonial was successfully updated.'
      redirect_to edit_operator_account_testimonial_url(@account, @testimonial)
    else
      render :action => "edit"
    end
  end


  def destroy
    @testimonial = @account.testimonials.find(params[:id])
    @testimonial.destroy

    redirect_to operator_account_testimonials_url
  end
end
