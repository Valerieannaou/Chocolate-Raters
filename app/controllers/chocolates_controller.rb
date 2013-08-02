class ChocolatesController < ApplicationController
  # GET /chocolates
  # GET /chocolates.json
  load_and_authorize_resource

  def index
    @chocolates = Chocolate.order("id").page(params[:page]).per_page(5)

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
      flash[:notice] = "Login to add new Chocolate"
     else
    @chocolate = Chocolate.new
    @chocolatiers = Chocolatier.by_active_status
    if @chocolatiers.blank?
       redirect_to new_chocolatier_path
      flash[:notice] = "Add a chocolatier to add chocolate"

      else
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chocolate }
    end
    end
     end
  end

  # GET /chocolates/1/edit
  def edit
    @chocolate = Chocolate.find(params[:id])
    @chocolatiers = Chocolatier.find_all_by_user_id_and_status(current_user.id,1)
  end

  # POST /chocolates
  # POST /chocolates.json
  def create
    @chocolate = Chocolate.new(params[:chocolate])
    @chocolatiers = Chocolatier.find_all_by_user_id_and_status(current_user.id,1)
    @chocolate.user_id = current_user.id

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
    #@chocolates = Chocolate.search(params[:search])
    @chocolates = Chocolate.search "*#{params[:search].downcase}*"
    @chocolates_by_unique_chocolatier = @chocolates.uniq{|x| x.chocolatier_id}

    if @chocolates.blank?
      flash[:notice]="Search do not match"
      redirect_to root_path
    else
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chocolates }
    end
    end
  end
  def rate_chocolate
    if current_user.blank?
      redirect_to new_user_session_path
      flash[:notice] = "Login to rate Chocolate"
      end
    @chocolate = Chocolate.find(params[:chocolate_id])

  end
  def recent_ratings
    @reviews = Rating.all(:order => 'created_at desc', :limit => 50)
  end
  def user_review
  user = params[:user_id]
  chocolate = params[:chocolate_id]
    @review = Rating.find_by_user_id_and_chocolate_id(user,chocolate)
    @user = User.find(user)
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

