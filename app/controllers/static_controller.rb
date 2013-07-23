class StaticController < ApplicationController
  layout "home"
  def home
    @reviews = Rating.all(:order => 'created_at desc', :limit => 6)
    @chocolates = Chocolate.all.sample(2)
  end
end
