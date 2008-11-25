class Operator < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :title


  def blank?
    name.blank?
  end
end
