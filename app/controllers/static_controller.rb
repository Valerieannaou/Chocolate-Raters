class StaticController < ApplicationController
  def home
    @reviews = Rating.all(:order => 'created_at desc', :limit => 5)
    @chocolates = Chocolate.all.sample(2)
  end
end
