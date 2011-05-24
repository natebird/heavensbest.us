class Operator::ServicesController < InheritedResources::Base
  layout "operator"
  before_filter :authenticate_user!
  before_filter :current_account
  before_filter :load_services, :only => [:index, :show, :new, :edit]
  before_filter :set_current_tab

  def index
    redirect_to edit_operator_account_service_path(@account, @services.first)
  end
  
  def show
    @services = @account.services
    
    @service = @account.services.find(params[:id])
  end
  
  def new
    @service = @account.services.new
  end
  
  def create
    @service = @account.services.new(params[:service])
    if @service.save
      flash[:notice] = "Successfully created service."
      redirect_to edit_operator_account_service_path(@account, @service)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @service = @account.services.find(params[:id])
  end
  
  def update
    @service = @account.services.find(params[:id])
    if @service.update_attributes(params[:service])
      flash[:notice] = "Successfully updated service."
      redirect_to(edit_operator_account_service_url(@account, @service))
    else
      render :url => 'edit'
    end
  end
  
  def destroy
    @service = @account.services.find(params[:id])
    @service.destroy
    flash[:notice] = "Successfully deleted service."
    redirect_to edit_operator_account_service_path(@account, @services.first)
  end

  def preview
    render :layout => false 
  end 

  protected
  
    def load_services
      @services = @account.services
    end
  
    def set_current_tab
      @current_tab = "services"
    end

end
