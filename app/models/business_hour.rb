class BusinessHour < ActiveRecord::Base
  attr_accessible :day, :ending_time, :starting_time
  #belongs_to :chocolatier
end
