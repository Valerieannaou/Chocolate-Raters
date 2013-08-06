class Chocolatier < ActiveRecord::Base
  attr_accessible :address, :chocolatier_type, :chocolatier_url, :city, :country, :email, :name, :phone, :state, :zip_code ,:photo
  belongs_to :user
  has_many :chocolates , :dependent => :destroy
  scope :by_active_status ,where(status: 1)
  scope :by_pending_status ,where(status: 0)
  mount_uploader :photo , ImageUploader
  #has_many :business_hours , :dependent => :destroy
  #accepts_nested_attributes_for :business_hours, :allow_destroy => true ,:reject_if => :all_blank
  #scope :by_chocolatier_name , lambda{ |name| where('name LIKE ?', "%#{name}%" ) unless name.nil? }
  #after_save ThinkingSphinx::RealTime.callback_for(:chocolatier)
  validates :name, :chocolatier_url , presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , :allow_blank => true
  validates_format_of :chocolatier_url, :with => URI::regexp
  validates_numericality_of :phone, :allow_blank => true

end
