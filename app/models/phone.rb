class Phone < ActiveRecord::Base
  # validates_length_of :number, :is => 10, :allow_blank => false, :message => "must consist of 10 digits!"

  def before_validation_on_create
    self.number = number.gsub(/[^0-9]/, "")
  end
  
  def before_validation_on_update
    self.number = number.gsub(/[^0-9]/, "")
  end

end
