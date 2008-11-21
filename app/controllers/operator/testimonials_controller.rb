class Operator::TestimonialsController < ApplicationController
  before_filter :login_required
  before_filter :current_account
  # before_filter :account_areas


  def index
    @testimonials = @account.testimonials.find(:all)
  end


  def show
    @testimonial = @account.testimonials.find(params[:id])
  end


  def new
    @testimonial = @account.testimonials.new do |t|
      t.name = "Name"
      t.location = "City, Region"
      t.quote = "Quote"
    end 
    @testimonials = @account.testimonials.find(:all)
  end


  def edit
    @testimonial = @account.testimonials.find(params[:id])
    @testimonials = @account.testimonials.find(:all)
  end


  def create
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
