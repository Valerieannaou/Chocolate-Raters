class Chocolate < ActiveRecord::Base
  attr_accessible :description, :name, :photos_attributes , :image ,:type_of_chocolate, :cocao, :chocolatier_id , :user_id
  belongs_to :chocolatier
  has_many :photos, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true ,:reject_if => :all_blank#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #mount_uploader :image , ImageUploader
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    end
  end

end
