class Rating < ActiveRecord::Base
  belongs_to :chocolate
  attr_accessible :chocolate_id, :rate, :user_id
end
