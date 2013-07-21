class RatingsController < ApplicationController
  authorize_resource
  def add_rating
    if current_user
      if params[:user_id] != current_user.id
      @ratings=Rating.new
      @ratings.chocolate_id = params[:chocolate_id]
      @ratings.rate = params[:rate]
      @ratings.user_id = current_user.id
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
      else
        redirect_to root
      end
      end

  end
  def edit_rating
    @ratings = Rating.find_by_chocolate_id_and_user_id(params[:chocolate_id],current_user.id)
    @ratings.rate = params[:rate]
    @ratings.look = params[:look]
    @ratings.smell = params[:smell]
    @ratings.snap = params[:snap]
    @ratings.mouthfeel = params[:mouthfeel]
    @ratings.taste = params[:taste]
    @ratings.aftertaste = params[:aftertaste]
    @ratings.comment = params[:comment]
    if @ratings.save
      #puts "[Saved]"
      respond_to do |format|
        format.html {redirect_to chocolate_path(:id => @ratings.chocolate_id) }
      end
    end
  end
  def index
    @ratings = Rating.order("created_at desc").page(params[:page]).per_page(10)
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :no_content }
    end
  end

end