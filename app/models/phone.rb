class Phone < ActiveRecord::Base
  def blank?
    number.blank?
  end
end
