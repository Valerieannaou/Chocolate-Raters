class Chocolate < ActiveRecord::Base
  attr_accessible :description, :name, :photos_attributes , :image ,:type_of_chocolate, :cocoa, :chocolatier_id
  belongs_to :chocolatier
  has_many :photos, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true ,:reject_if => :all_blank#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #mount_uploader :image , ImageUploader
  #scope :by_chocolate_name , lambda{ |name| where('name LIKE ?', "%#{name}%" ) unless name.nil? }

end
