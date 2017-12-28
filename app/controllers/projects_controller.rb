class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'


  def recent_projects
    
        @projects = Project.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
        @domains = Domain.all
   
    
  end

  def projects_by_category
    @projects = Project.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
    @domains = Domain.all

   
  end
  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
    @bids = current_user.bids.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
   
  end

  def projects_nearby
    city = current_user.profile.city
    country = current_user.profile.country
    @projects = Project.location(country, city).order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
    
  end



    def update_skills
      # updates songs based on artist selected
      category = Category.find(params[:category_id])
      @all_skills = category.skills.map{|s| [s.title, s.id]}.insert(0, "Select a Song")
    end


  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_bids = @project.bids.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)

    @total_bids = @project.bids.count unless @project_bids.blank?
    
    @bid = Bid.new


    # Project skills
    @project_skills = @project.project_skills

    # Update view number
    view_number = @project.view_number.to_i + 1
    
    @project.update_attributes(:view_number => view_number)

   

  end

  # GET /projects/new
  def new
    @project = Project.new
    @currencies = Currency.all
    @time_unity = TimeUnity.all
    @all_skills = Skill.all
    @professions = Profession.all
    @budgets = Budget.all

    
  end

  # GET /projects/1/edit
  def edit
    # Get all currency
    @currencies = Currency.all


    @time_unity = TimeUnity.all

    # Get all Skill
    @all_skills = Skill.all

    # Get all Profession.
    @professions = Profession.all
     @budgets = Budget.all



    project_skills = @project.project_skills 

    @selected_skills = project_skills unless project_skills.blank?

  
  end

  # POST /projects
  # POST /projects.json
  def create
    @currencies = Currency.all
    @time_unity = TimeUnity.all
    @all_skills = Skill.all
    @professions = Profession.all
    @budgets = Budget.all

    @project = current_user.projects.build(project_params)

    # Create ProjectSkill
    params[:skills][:id].each do |skill|
      unless skill.empty?
        @project.project_skills.build(skill_id: skill)
      end
    end

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_show_path(@project), notice: t(:project_create_successfull) }
        format.json { render :show, status: :created, location: project_show_path(@project)}
      else
        format.html { render :new, alert: 'Error.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.project_skills.delete_all
    # Create ProjectSkill
    params[:skills][:id].each do |skill|
      unless skill.empty?
        @project.project_skills.build(skill_id: skill)
      end
    end
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_show_path(@project), notice: t(:project_create_successfull) }
        format.json { render :show, status: :ok, location: project_show_path(@project)}
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: t(:project_destroy_successfull) }
      format.json { head :no_content }
    end
  end
  def delete
      @project = Project.friendly.find(params[:project_id])
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id]) if params[:id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :content, :profession_id, :budget, :currency_id,  :expire_at)
    end
end
