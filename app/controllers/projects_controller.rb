class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]



  def last_projects
    @last_projects = Project.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)

    render layout: 'dashboard'
  end
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    render layout: 'dashboard'
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_bids = @project.bids.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
    render layout: 'dashboard'

  end

  # GET /projects/new
  def new
    @project = Project.new
    render layout: 'dashboard'
  end

  # GET /projects/1/edit
  def edit
    render layout: 'dashboard'
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
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
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :content, :budget, :currency_id, :time_limit)
    end
end
