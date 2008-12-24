class Admin::PagesController < ApplicationController
  layout "operator"
  include ModelControllerMethods
  before_filter :admin?
  
end
