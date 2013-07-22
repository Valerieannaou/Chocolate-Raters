class Chocolatier < ActiveRecord::Base
  attr_accessible :address, :chocolatier_type, :chocolatier_url, :city, :country, :email, :name, :phone, :state, :zip_code , :business_hours_attributes
  belongs_to :user
  has_many :chocolates , :dependent => :destroy
  scope :by_active_status ,where(status: 1)
  scope :by_pending_status ,where(status: 0)
  #has_many :business_hours , :dependent => :destroy
  #accepts_nested_attributes_for :business_hours, :allow_destroy => true ,:reject_if => :all_blank
  scope :by_chocolatier_name , lambda{ |name| where('name LIKE ?', "%#{name}%" ) unless name.nil? }
end
