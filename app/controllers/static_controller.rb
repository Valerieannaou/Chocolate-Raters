class StaticController < ApplicationController
  def home
    @reviews = Rating.all(:order => 'created_at desc', :limit => 5)
  end
end
