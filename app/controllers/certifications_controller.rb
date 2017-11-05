class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show, :edit, :update, :destroy]

  # GET /certifications
  # GET /certifications.json
  def index
    @certifications = current_user.certifications
  end

  # GET /certifications/1
  # GET /certifications/1.json
  def show
     @certifications = current_user.certifications
  end

  # GET /certifications/new
  def new
    @certification = Certification.new
  end

  # GET /certifications/1/edit
  def edit
     @certifications = current_user.certifications
  end

  # POST /certifications
  # POST /certifications.json
  def create
     @certifications = current_user.certifications
    @certification = current_user.certifications.build(certification_params)

    respond_to do |format|
      if @certification.save
        format.html { redirect_to @certification, notice: 'Certification was successfully created.' }
        format.json { render :show, status: :created, location: @certification }
        format.js
      else
        format.html { render :new }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
         format.js
      end
    end
  end

  # PATCH/PUT /certifications/1
  # PATCH/PUT /certifications/1.json
  def update
     @certifications = current_user.certifications
    respond_to do |format|
      if @certification.update(certification_params)
        format.html { redirect_to @certification, notice: 'Certification was successfully updated.' }
        format.json { render :show, status: :ok, location: @certification }
         format.js
      else
        format.html { render :edit }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
         format.js
      end
    end
  end

  # DELETE /certifications/1
  # DELETE /certifications/1.json
  def destroy
     @certifications = current_user.certifications
    @certification.destroy
    respond_to do |format|
      format.html { redirect_to certifications_url, notice: 'Certification was successfully destroyed.' }
      format.json { head :no_content }
       format.js
    end
  end
  def delete
      @certification = Certification.find(params[:certification_id])
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certification
      @certification = Certification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certification_params
      params.require(:certification).permit(:title, :description, :date_of_obtaining, :country, :user_id)
    end
end
