class Admin::PhotosController < ApplicationController
  layout "operator"
  include ModelControllerMethods
  before_filter :admin_only
  
end