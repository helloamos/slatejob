class ProfessionSkillsController < ApplicationController
  before_action :set_profession_skill, only: [:show, :edit, :update, :destroy]

  # GET /profession_skills
  # GET /profession_skills.json
  def index
    @profession_skills = ProfessionSkill.all
  end

  # GET /profession_skills/1
  # GET /profession_skills/1.json
  def show
  end

  # GET /profession_skills/new
  def new
    @profession_skill = ProfessionSkill.new
  end

  # GET /profession_skills/1/edit
  def edit
  end

  # POST /profession_skills
  # POST /profession_skills.json
  def create
    @profession_skill = ProfessionSkill.new(profession_skill_params)

    respond_to do |format|
      if @profession_skill.save
        format.html { redirect_to @profession_skill, notice: 'Profession skill was successfully created.' }
        format.json { render :show, status: :created, location: @profession_skill }
      else
        format.html { render :new }
        format.json { render json: @profession_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profession_skills/1
  # PATCH/PUT /profession_skills/1.json
  def update
    respond_to do |format|
      if @profession_skill.update(profession_skill_params)
        format.html { redirect_to @profession_skill, notice: 'Profession skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @profession_skill }
      else
        format.html { render :edit }
        format.json { render json: @profession_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profession_skills/1
  # DELETE /profession_skills/1.json
  def destroy
    @profession_skill.destroy
    respond_to do |format|
      format.html { redirect_to profession_skills_url, notice: 'Profession skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profession_skill
      @profession_skill = ProfessionSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profession_skill_params
      params.require(:profession_skill).permit(:title)
    end
end
