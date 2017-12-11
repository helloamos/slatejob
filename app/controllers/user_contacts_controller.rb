class ProfilesController < ApplicationController
   require 'openssl'
   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  before_action :authenticate_user!
  before_action :set_user_contact, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @user_contact = UserContact.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @user_contact = UserContact.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @user_contact = current_user.build_user_contact(user_contact_params)

    respond_to do |format|
      if @user_contact.save

       
        ## Redirection
        format.html { redirect_to edit_profile_path(current_user), notice: t(:user_contact_create_successfull) }
        format.json { render :show, status: :created, location: @user_detail }
        format.js
      else
        format.html { redirect_to edit_profile_path(current_user), alert: t(:user_contact_create_error) }
        format.json { render json: @user_contact.errors, danger: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @user_contact.update(user_contact_params)
        format.html { redirect_to edit_profile_path(current_user), notice: t(:user_contact_update_successfull) }
        format.json { render :show, status: :ok, location: profile_path }
        
      else
        format.html { redirect_to edit_profile_path(current_user) }
        format.json { render json: @user_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @user_contact.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_contact
      @user_contact = UserContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_contact_params
      params.require(:user_contact).permit(:address, :phone)
    end
end


