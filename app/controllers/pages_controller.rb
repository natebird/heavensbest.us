class PagesController < ApplicationController

  def index
    @pages = Page.find(:all)
  end

  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
      raise ActiveRecord::RecordNotFound, "Page not found" if @page.nil?
      render :layout => @page.category
    else
      @page = Page.find(params[:id])
    end
  end

end