class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all


  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
    @currency = Currency.all
    @time_unity = TimeUnity.all
    render layout: "dashboard"
  end

  # GET /bids/1/edit
  def edit
    @currency = Currency.all
    @time_unity = TimeUnity.all
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = current_user.bids.build(bid_params)

    project = Project.friendly.find(@bid.project_id)
    respond_to do |format|
      if @bid.save
        

        #Retrieve params
        sender_id = current_user.id
        receiver_id = project.user_id
        #@project_url = Project.friendly.find(project.id)
        #@project_url = project_show_path(project.id)

        # Send notification
        content = "vient de faire une offre pour votre projet"
        Notification.create(:content => content, :sender_id => current_user.id, :receiver_id => receiver_id)

        BidMailer.bid_email(project.user_id, current_user.id, project.id).deliver_now
        #flash['notice'] = "Aimé avec success!"

        format.html { redirect_to project_show_path(project), notice: t(:bid_create_successfully) }
        format.json { render :show, status: :created, location: @bid }
        format.js

      else
        format.html { render :new }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
          format.js

      end
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
          format.js
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:content, :amount, :time_limit, :project_id, :currency_id, :time_unity_id)
    end
end
