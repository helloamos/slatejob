class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  # GET /educations
  # GET /educations.json
  def index
    @educations = current_user.educations
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
      @educations = current_user.educations
  end

  # POST /educations
  # POST /educations.json
  def create
    @educations = current_user.educations
    @education = current_user.educations.build(education_params)

    respond_to do |format|
      if @education.save
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @education }
        format.js 
         
         flash[:notice] = 'Education was successfully updated.' 
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
        format.js 
        flash[:alert] = 'Error.' 
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
      @educations = current_user.educations
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
     @educations = current_user.educations
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

def delete
      @education = Education.find(params[:education_id])
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:start_date, :end_date,:degree, :school, :country, :user_id)
    end
end
