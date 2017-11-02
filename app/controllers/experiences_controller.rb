class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = current_user.experiences
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
    @experiences = current_user.experiences
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experiences = current_user.experiences
    @experience = current_user.experiences.build(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
        format.js
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    @experiences = current_user.experiences
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
         format.js
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
         format.js
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experiences = current_user.experiences
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def delete
      @experience = Experience.find(params[:experience_id])
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:start_date, :end_date, :position, :company, :country, :task, :currently_working, :user_id)
    end
end
