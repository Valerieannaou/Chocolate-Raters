class StaticController < ApplicationController
  layout "home"
  def home
    #@reviews = nil
    @reviews = Rating.all(:order => 'created_at desc', :limit => 6)
    @chocolates = Chocolate.all.sample(2)
    #@chocolates = nil
  end
end
