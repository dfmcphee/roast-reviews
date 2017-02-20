class RoastersController < ApplicationController
  before_action :set_roaster, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /roasters
  # GET /roasters.json
  def index
    @roasters = Roaster.all
  end

  # GET /roasters/1
  # GET /roasters/1.json
  def show
  end

  # GET /roasters/new
  def new
    @roaster = Roaster.new
  end

  # GET /roasters/1/edit
  def edit
  end

  # POST /roasters
  # POST /roasters.json
  def create
    @roaster = Roaster.new(roaster_params)

    respond_to do |format|
      if @roaster.save
        format.html { redirect_to @roaster, notice: 'Roaster was successfully created.' }
        format.json { render :show, status: :created, location: @roaster }
      else
        format.html { render :new }
        format.json { render json: @roaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roasters/1
  # PATCH/PUT /roasters/1.json
  def update
    respond_to do |format|
      if @roaster.update(roaster_params)
        format.html { redirect_to @roaster, notice: 'Roaster was successfully updated.' }
        format.json { render :show, status: :ok, location: @roaster }
      else
        format.html { render :edit }
        format.json { render json: @roaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roasters/1
  # DELETE /roasters/1.json
  def destroy
    @roaster.destroy
    respond_to do |format|
      format.html { redirect_to roasters_url, notice: 'Roaster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roaster
      @roaster = Roaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roaster_params
      params.require(:roaster).permit(:name, :description, :location)
    end
end
