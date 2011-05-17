class Admin::PhotosController < InheritedResources::Base
  layout "operator"
  before_filter :admin?
  
end
