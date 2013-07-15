class ChocolatiersController < ApplicationController
  # GET /chocolatiers
  # GET /chocolatiers.json
  def index
    @chocolatiers = Chocolatier.all

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
    @chocolatier = Chocolatier.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chocolatier }
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
