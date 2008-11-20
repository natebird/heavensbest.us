class Admin::PagesController < Operator::ApplicationController
  layout "operator"
  include ModelControllerMethods
  before_filter :admin_only
  
end
