class Operator::TestimonialsController < InheritedResources::Base
  layout "operator"
  before_filter :authenticate_user!
  before_filter :current_account
  before_filter :load_testimonials, :only => [:index, :show, :new, :edit]
  before_filter :set_current_tab

  def index
    redirect_to edit_operator_account_testimonial_path(@account, @testimonials.first)
  end


  def show
    @testimonial = @account.testimonials.find(params[:id])
  end


  def new
    @testimonial = @account.testimonials.new 
    @testimonials = @account.testimonials.all
  end


  def edit
    @testimonial = @account.testimonials.find(params[:id])
    @testimonials = @account.testimonials.all
  end


  def create
    @testimonials = @account.testimonials.all
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
  
  protected
    
    def load_testimonials
      @testimonials = current_account.testimonials
    end
    
    def set_current_tab
      @current_tab = "testimonials"
    end
    
end
