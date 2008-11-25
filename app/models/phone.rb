class Phone < ActiveRecord::Base
  validates_presence_of :number

  def blank?
    number.blank?
  end
end
