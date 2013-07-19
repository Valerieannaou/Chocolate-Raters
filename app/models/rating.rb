class Rating < ActiveRecord::Base
  belongs_to :chocolate
  belongs_to :user
  attr_accessible :chocolate_id, :rate, :user_id
end
