class Operator::SpecialsController < InheritedResources::Base
  layout "operator"
  before_filter :authenticate_user!
  before_filter :current_account
  before_filter :load_specials, :only => [:index, :show, :new, :edit]
  before_filter :set_current_tab

  def index
    redirect_to edit_operator_account_special_path(@account, @specials.first)
  end


  def show
    @special = @account.specials.find(params[:id])
  end


  def new
    @special = @account.specials.new
  end


  def edit
    @special = @account.specials.find(params[:id])
  end


  def create
    @specials = @account.specials.all
    @special = @account.specials.new(params[:special])

    if @special.save
      flash[:notice] = 'Special was successfully created.'
      redirect_to(edit_operator_account_special_url(@account, @special))
    else
      render :action => "new"
    end
  end


  def update
    @specials = @account.specials.all
    @special = @account.specials.find(params[:id])

    if @special.update_attributes(params[:special])
      flash[:notice] = 'Special was successfully updated.'
      redirect_to(edit_operator_account_special_url(@account, @special))
    else
      render :action => "edit"
    end
  end


  def destroy
    @special = @account.specials.find(params[:id])
    @special.destroy
    redirect_to(operator_account_specials_url(@account))
  end
  
  protected
    
    def load_specials
      @specials = current_account.specials
    end
  
    def set_current_tab
      @current_tab = "specials"
    end
  
end
