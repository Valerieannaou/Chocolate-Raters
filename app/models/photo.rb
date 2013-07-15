class Photo < ActiveRecord::Base
  attr_accessible :chocolate_id, :image
  belongs_to :chocolate
  mount_uploader :image , ImageUploader
end
