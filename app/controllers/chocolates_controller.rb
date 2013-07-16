class ChocolatesController < ApplicationController
  # GET /chocolates
  # GET /chocolates.json
  load_and_authorize_resource

  def index
    @chocolates = Chocolate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chocolates }
    end
  end

  # GET /chocolates/1
  # GET /chocolates/1.json
  def show
    @chocolate = Chocolate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chocolate }
    end
  end

  # GET /chocolates/new
  # GET /chocolates/new.json
  def new
    if current_user.blank?
      redirect_to new_user_session_path
    end
    @chocolate = Chocolate.new
    @chocolatiers = Chocolatier.find_all_by_user_id(current_user.id)
    #@chocolate.photos.build #if @chocolate.photos.empty?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chocolate }
    end
  end

  # GET /chocolates/1/edit
  def edit
    @chocolate = Chocolate.find(params[:id])
    @chocolatiers = Chocolatier.find_all_by_user_id(current_user.id)
  end

  # POST /chocolates
  # POST /chocolates.json
  def create
    @chocolate = Chocolate.new(params[:chocolate])

    respond_to do |format|
      if @chocolate.save
        format.html { redirect_to @chocolate, notice: 'Chocolate was successfully created.' }
        format.json { render json: @chocolate, status: :created, location: @chocolate }
      else
        format.html { render action: "new" }
        format.json { render json: @chocolate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chocolates/1
  # PUT /chocolates/1.json
  def update
    @chocolate = Chocolate.find(params[:id])
    #@photo =Photo.new(params[:photos_attributes])
    #@photo.save

    respond_to do |format|
      if @chocolate.update_attributes(params[:chocolate])
        format.html { redirect_to @chocolate, notice: 'Chocolate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chocolate.errors, status: :unprocessable_entity }
      end
    end
  end
  def show_search
    @chocolates = Chocolate.search(params[:search])
    if @chocolates.blank?
      flash[:notice]="Search do not match"
      redirect_to chocolates_path
    else
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chocolates }
    end
    end
  end
  def rate_chocolate
    @chocolate_id = params[:chocolate_id]

  end

  # DELETE /chocolates/1
  # DELETE /chocolates/1.json
  def destroy
    @chocolate = Chocolate.find(params[:id])
    @chocolate.destroy

    respond_to do |format|
      format.html { redirect_to chocolates_url }
      format.json { head :no_content }
    end
  end
end

