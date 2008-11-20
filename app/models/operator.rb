class Operator < ActiveRecord::Base
  def blank?
    name.blank?
  end
end
