class RatingsController < ApplicationController
  def add_rating

      @ratings=Rating.new
      @ratings.chocolate_id = params[:chocolate_id]
      @ratings.rate = params[:rate]
      @ratings.user_id = params[:user_id]
      @ratings.look = params[:look]
      @ratings.smell = params[:smell]
      @ratings.snap = params[:snap]
      @ratings.mouthfeel = params[:mouthfeel]
      @ratings.taste = params[:taste]
      @ratings.aftertaste = params[:aftertaste]
      @ratings.comment = params[:comment]

      puts @ratings.inspect
      #@ratings.save
      if @ratings.save
        #puts "[Saved]"
      respond_to do |format|
        format.html {redirect_to chocolate_path(:id => @ratings.chocolate_id) }
      end
      end
  end

end