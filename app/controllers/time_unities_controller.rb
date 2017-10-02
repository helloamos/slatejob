class TimeUnitiesController < ApplicationController
  before_action :set_time_unity, only: [:show, :edit, :update, :destroy]

  # GET /time_unities
  # GET /time_unities.json
  def index
    @time_unities = TimeUnity.all
  end

  # GET /time_unities/1
  # GET /time_unities/1.json
  def show
  end

  # GET /time_unities/new
  def new
    @time_unity = TimeUnity.new
  end

  # GET /time_unities/1/edit
  def edit
  end

  # POST /time_unities
  # POST /time_unities.json
  def create
    @time_unity = TimeUnity.new(time_unity_params)

    respond_to do |format|
      if @time_unity.save
        format.html { redirect_to @time_unity, notice: 'Time unity was successfully created.' }
        format.json { render :show, status: :created, location: @time_unity }
      else
        format.html { render :new }
        format.json { render json: @time_unity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_unities/1
  # PATCH/PUT /time_unities/1.json
  def update
    respond_to do |format|
      if @time_unity.update(time_unity_params)
        format.html { redirect_to @time_unity, notice: 'Time unity was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_unity }
      else
        format.html { render :edit }
        format.json { render json: @time_unity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_unities/1
  # DELETE /time_unities/1.json
  def destroy
    @time_unity.destroy
    respond_to do |format|
      format.html { redirect_to time_unities_url, notice: 'Time unity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_unity
      @time_unity = TimeUnity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_unity_params
      params.require(:time_unity).permit(:title)
    end
end
