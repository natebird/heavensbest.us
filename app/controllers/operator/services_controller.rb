class Operator::ServicesController < ApplicationController
  layout "operator"
  before_filter :login_required
  before_filter :current_account
  include ModelControllerMethods

  before_filter :set_current_tab
    def set_current_tab
      @current_tab = "services"
    end

  def index
    @services = current_account.services.all
    redirect_to edit_operator_account_service_path(@account, @services.first)
  end
  
  def show
    @service = @account.services.find(params[:id])
    @services = @account.services.all
  end
  
  def new
    @service = @account.services.new
    @services = @account.services.all
  end
  
  def create
    @services = @account.services.all
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
    @services = @account.services.all
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
    redirect_to :action => 'index'
  end

  def preview
    render :layout => false 
  end 

  protected
  
    def scoper
      current_account.services
    end
end
