class Admin::TipsController < ApplicationController
  layout "operator"
  include ModelControllerMethods
  before_filter :admin_only

  def index
    @tips = Tip.find(:all)
  end


  def new
    @tip = Tip.new
    @tips = Tip.find(:all)
  end


  def edit
    @tip = Tip.find(params[:id])
    @tips = Tip.find(:all)
  end

end
