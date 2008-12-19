class Operator::SpecialsController < ApplicationController
  layout "operator"
  before_filter :login_required
  before_filter :current_account

  def index
    @specials = @account.specials.find(:all)
  end


  def show
    @special = @account.specials.find(params[:id])
    @specials = @account.specials.find(:all)
  end


  def new
    @special = @account.specials.new
    @specials = @account.specials.find(:all)
  end


  def edit
    @special = @account.specials.find(params[:id])
    @specials = @account.specials.find(:all)
  end


  def create
    @specials = @account.specials.find(:all)
    @special = @account.specials.new(params[:special])

    if @special.save
      flash[:notice] = 'Special was successfully created.'
      redirect_to(edit_operator_account_special_url(@account, @special))
    else
      render :action => "new"
    end
  end


  def update
    @specials = @account.specials.find(:all)
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
end
