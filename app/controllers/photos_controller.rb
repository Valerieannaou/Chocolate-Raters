class PhotosController < ApplicationController
  authorize_resource
  def new

      @photo = Photo.new(:chocolate_id => params[:chocolate_id])
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @photo }
      end
  end
  def create
    params[:photo].each do |photos|
      @photo=Photo.create(photos)
    end
    respond_to do |format|
      if @photo.save
        format.html { redirect_to chocolate_path(:id => @photo.chocolate_id), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

end