class SitemapPluginController < ActionController::Base
  layout 'sitemap_plugin'
  before_filter :check_sitemap_auth
  protect_from_forgery :secret => 'b0a876313f3f9195e9bd01473bc5cd06'
  
  def check_sitemap_auth
    settings = SitemapSetting.find(:first)
    return unless settings && settings.username && settings.password
    authenticate_or_request_with_http_basic do |username, password|
      username == settings.username && password == settings.password
    end
  end
  
end