class Admin::TipsController < InheritedResources::Base
  layout "operator"
  before_filter :admin?
  before_filter :load_tips, :only => [:index, :new, :edit]

  def index
    redirect_to edit_admin_tip_path(@tips.first)
  end
  
  protected
  
    def load_tips
      @tips = Tip.all
    end

end
