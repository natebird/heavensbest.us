class SitemapsController < ActionController::Base
  
  def show
    @widgets = SitemapWidget.find(:all)
    @site = SitemapSetting.find(:first)
    @static_links = SitemapStaticLink.find(:all)
    # @accounts = Account.find(:all)
    # @region = Region.find_by_abbreviation(@account.region.upcase)
    respond_to do |format|
      format.html
      format.xml
      format.css
      format.xsl
    end
  end
  
end