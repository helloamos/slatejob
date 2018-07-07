class AwardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_award, only: [:show, :edit, :update, :destroy]

  # GET /awards
  # GET /awards.json
  def index
    @awards = current_user.awards
  end

  # GET /awards/1
  # GET /awards/1.json
  def show
  end

  # GET /awards/new
  def new
    @award = Award.new
  end

  # GET /awards/1/edit
  def edit
    @awards = current_user.awards
  end

  # POST /awards
  # POST /awards.json
  def create
    @awards = current_user.awards
    @award = current_user.awards.build(award_params)

    respond_to do |format|
      if @award.save
        format.html { redirect_to @award, notice: 'Award was successfully created.' }
        format.json { render :show, status: :created, location: @award }
        format.js
      else
        format.html { render :new }
        format.json { render json: @award.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /awards/1
  # PATCH/PUT /awards/1.json
  def update
    @awards = current_user.awards
    respond_to do |format|
      if @award.update(award_params)
        format.html { redirect_to @award, notice: 'Award was successfully updated.' }
        format.json { render :show, status: :ok, location: @award }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @award.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @awards = current_user.awards
    @award.destroy
    respond_to do |format|
      format.html { redirect_to awards_url, notice: 'Award was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def delete
      @award = Award.find(params[:award_id])
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_award
      @award = Award.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def award_params
      params.require(:award).permit(:title, :description, :date_of_obtaining, :conferring_organization, :user_id)
    end
end
