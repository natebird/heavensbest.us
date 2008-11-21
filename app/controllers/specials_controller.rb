class SpecialsController < ApplicationController
  # layout "print", :except => :index
  
  def index
    @specials = current_account.specials.find(:all)
  end


  def show
    @special = current_account.specials.find(params[:id])
  end

end
