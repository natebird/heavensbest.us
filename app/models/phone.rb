class Phone < ActiveRecord::Base
  validates_presence_of :number
  # validates_length_of :number, :is=>10, :message => "must consist of 10 digits!"

  # def before_validation_on_create
  #    self.number = number.gsub(/[^0-9]/, "")
  # end

  # def blank?
  #   number.blank?
  # end
end
