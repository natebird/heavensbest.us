class Phone < ActiveRecord::Base
  # validates_length_of :number, :is => 10, :allow_blank => false, :message => "must consist of 10 digits!"

  before_validation(:on => [:create, :update]) do
    self.number = number.gsub(/[^0-9]/, "")
  end

end
