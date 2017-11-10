class UserDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_detail, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @user_detail = UserDetail.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @profession = Profession.all
    @user_detail = UserDetail.new
  end

  # GET /subscriptions/1/edit
  def edit
    @professions = Profession.all
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @user_detail = current_user.build_user_detail(user_detail_params)

    respond_to do |format|
      if @user_detail.save

       
        ## Redirection
        format.html { redirect_to edit_profile_path(current_user), notice: t(:user_detail_successfull) }
        format.json { render :show, status: :created, location: edit_profile_path(current_user) }
      else
        format.html { redirect_to edit_profile_path(current_user), alert: t(:user_detail_error) }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @user_detail.update(user_detail_params)
        format.html { redirect_to edit_profile_path(current_user), notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: edit_profile_path }
      else
        format.html { redirect_to edit_profile_path(current_user) }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_detail
      @user_detail = UserDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_detail_params
      params.require(:user_detail).permit(:profession_id, :presentation, :availability, :visibility, :employment_type, :facebook_link, :twitter_link, :linkedin_link, :gplus_link)
    end
end
