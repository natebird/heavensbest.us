class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :region
  has_many :services
  has_many :specials
  has_many :testimonials
  has_many :phones
  has_many :operators
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :operators, :allow_destroy => true, :reject_if => :all_blank
  
  has_friendly_id :name, :use_slug => true, :scope => :region
  
  validates_uniqueness_of :name
  validates_presence_of :name, :email, :region_id, :locations
  validates_acceptance_of :accept, :on => :create, :message => "must be checked"
    
  after_create :seed_data
    
  def self.to_dropdown
    all(:order => 'name').collect {|s| [s.name, s.id]}
  end

  def to_s
    name
  end
  
  
  protected
    
    # # called after validations and after the account has been persisted to the database
    def seed_data
      # background it in case it is slow
      # spawn do 
        # call the background script you have and pass in the account id
        populate_defaults (self.id)
      # end
    end
    
end
