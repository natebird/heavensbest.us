class TipsController < ApplicationController

  def index
    @tips = Tip.find(:all)
  end


  def show
    @tip = Tip.find(params[:id])
  end

end
