class Admin::TipsController < ApplicationController
  layout "operator"
  include ModelControllerMethods
  before_filter :admin?

  def index
    @tips = Tip.all
  end


  def new
    @tip = Tip.new
    @tips = Tip.all
  end


  def edit
    @tip = Tip.find(params[:id])
    @tips = Tip.all
  end

end
