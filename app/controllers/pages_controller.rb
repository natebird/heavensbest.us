class PagesController < ApplicationController

  def index
    redirect_to general_services_path
  end

  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
      @current_tab = @page.permalink
      raise ActiveRecord::RecordNotFound, "Page not found" if @page.nil?
      render :layout => @page.category
    else
      @page = Page.find(params[:id])
    end
  end

end