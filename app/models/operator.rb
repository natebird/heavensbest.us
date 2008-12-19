class Operator < ActiveRecord::Base
  validates_presence_of :name, :title


  def blank?
    name.blank?
  end
end
