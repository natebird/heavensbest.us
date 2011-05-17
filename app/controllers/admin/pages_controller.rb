class Admin::PagesController < InheritedResources::Base
  layout "operator"
  before_filter :admin?
  
end
