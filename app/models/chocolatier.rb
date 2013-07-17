class Chocolatier < ActiveRecord::Base
  attr_accessible :address, :chocolatier_type, :chocolatier_url, :city, :country, :email, :name, :phone, :state, :zip_code , :business_hours_attributes
  belongs_to :user
  has_many :chocolates , :dependent => :destroy
  #has_many :business_hours , :dependent => :destroy
  #accepts_nested_attributes_for :business_hours, :allow_destroy => true ,:reject_if => :all_blank
end
