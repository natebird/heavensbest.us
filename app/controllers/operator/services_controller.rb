class Operator::ServicesController < Operator::ApplicationController
  layout "operator"
  include ModelControllerMethods

  def index
    @services = current_account.services.find(:all)
  end
  
  def show
    @service = @account.services.find(params[:id])
    @services = @account.services.find(:all)
  end
  
  def new
    @service = @account.services.new
    @services = @account.services.find(:all)
  end
  
  def create
    @service = @account.services.new(params[:service])
    if @service.save
      flash[:notice] = "Successfully created service."
      redirect_to operator_account_service_path(@account, @service)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @service = @account.services.find(params[:id])
    @services = @account.services.find(:all)
  end
  
  def update
    @service = @account.services.find(params[:id])
    if @service.update_attributes(params[:service])
      flash[:notice] = "Successfully updated service."
      redirect_to :action => 'edit'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @service = @account.services.find(params[:id])
    @service.destroy
    flash[:notice] = "Successfully destroyed service."
    redirect_to operator_services_url
  end

  def preview
    render :layout => false 
  end 

  protected
  
    def scoper
      current_account.services
    end
end
