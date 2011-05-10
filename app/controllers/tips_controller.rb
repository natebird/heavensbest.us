class TipsController < ApplicationController

  def index
    @tips = Tip.all
  end


  def show
    @tip = Tip.find(params[:id])
  end

end
