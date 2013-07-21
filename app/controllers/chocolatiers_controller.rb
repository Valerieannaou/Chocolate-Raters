class ChocolatiersController < ApplicationController
  # GET /chocolatiers
  # GET /chocolatiers.json
  load_and_authorize_resource
  def requests
    @chocolatiers = Chocolatier.by_pending_status.order("id").page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chocolatiers }
    end

  end
  def index
    @chocolatiers = Chocolatier.by_active_status.order("id").page(params[:page]).per_page(10)
    #@chocolatiers = Chocolatier.find_all_by_status(1)
    #@chocolatiers = Chocolatier.order("id").page(params[:page]).per_page(5)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chocolatiers }
    end
  end

  # GET /chocolatiers/1
  # GET /chocolatiers/1.json
  def show
    @chocolatier = Chocolatier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chocolatier }
    end
  end

  # GET /chocolatiers/new
  # GET /chocolatiers/new.json
  def new
    if current_user.blank?
      flash[:notice] = "Login to add new Chocolatier"
      redirect_to new_user_session_path

     else
    @chocolatier = Chocolatier.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chocolatier }
    end
    end
  end

  # GET /chocolatiers/1/edit
  def edit
    @chocolatier = Chocolatier.find(params[:id])
  end

  # POST /chocolatiers
  # POST /chocolatiers.json
  def create
    @chocolatier = Chocolatier.new(params[:chocolatier])
    @chocolatier.status = 0
    @chocolatier.user_id= current_user.id

    respond_to do |format|
      if @chocolatier.save
        format.html { redirect_to @chocolatier, notice: 'Chocolatier was successfully created.' }
        format.json { render json: @chocolatier, status: :created, location: @chocolatier }
      else
        format.html { render action: "new" }
        format.json { render json: @chocolatier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chocolatiers/1
  # PUT /chocolatiers/1.json
  def update
    @chocolatier = Chocolatier.find(params[:id])

    respond_to do |format|
      if @chocolatier.update_attributes(params[:chocolatier])
        format.html { redirect_to @chocolatier, notice: 'Chocolatier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chocolatier.errors, status: :unprocessable_entity }
      end
    end
  end
  def approve
    @chocolatier = Chocolatier.find(params[:id])
    @chocolatier.status = 1
    if @chocolatier.save
    redirect_to requests_chocolatiers_path
      end

  end

  # DELETE /chocolatiers/1
  # DELETE /chocolatiers/1.json
  def destroy
    @chocolatier = Chocolatier.find(params[:id])
    @chocolatier.destroy

    respond_to do |format|
      format.html { redirect_to chocolatiers_url }
      format.json { head :no_content }
    end
  end
end
