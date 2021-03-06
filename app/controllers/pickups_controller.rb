class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :update_coordinates, :destroy]
  helper_method :can_edit

  # GET /pickups
  # GET /pickups.json
  def index
    wallet_id = get_logged_user.wallet.id
    params['wallet_id'] = wallet_id
    @pickers = wallet_pickers

    if params['coordinates'] == 'true'
      params[:has_coords] = true
      params[:has_not_coords] = nil
    elsif params['coordinates'] == 'false'
      params[:has_not_coords] = true
      params[:has_coords] = nil
    end

    @pickups = Pickup
      #.where(wallet_id: wallet_id)
      .filter(params)
      .order(picked_at: :desc)
      .page(params[:page])
      .per(20)

    @show_filter_form = (!(params[:year].blank?)) | (!(params[:picker_id].blank?)) | (!(params[:coordinates].blank?))
    @years = Pickup.pluck('DISTINCT year').sort.reverse
    @year = (params['year'] || @years.max).to_i

    respond_to do |format|
      format.html
      format.csv { render text: @pickups.to_csv }
    end
  end

  # GET /pickups/1
  # GET /pickups/1.json
  def show
    user = get_logged_user
    @can_edit = (user.owner? or @pickup.picker == user)
  end

  # GET /pickups/new
  def new
    @pickup = Pickup.new
    @pickup.picked_at = Time.zone.now
    @pickers = wallet_pickers
    @can_view_hand_over = false
  end

  # GET /pickups/1/edit
  def edit
    @pickers = wallet_pickers
    @edit_mode = true
    user = get_logged_user
    @can_view_hand_over = user.owner?
    @cannot_edit_hand_over = @pickup.picker.id == user.id
  end

  # POST /pickups
  # POST /pickups.json
  def create
    @pickup = Pickup.new(pickup_params)
    @pickup.picker = get_logged_user
    @pickup.wallet = @pickup.picker.wallet
    @pickup.handed_over = @pickup.picker.owner?
    @pickup.year = @pickup.picked_at.year

    respond_to do |format|
      if @pickup.save
        format.html { redirect_to pickups_url, notice: 'Pickup was created.' }
        format.json { render :index, status: :created, location: @pickups }
      else
        format.html { render :new }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickups/1
  # PATCH/PUT /pickups/1.json
  def update
    @pickup.year = @pickup.picked_at.year
    respond_to do |format|
      if @pickup.update(pickup_params)
        format.html { redirect_to pickups_url, notice: 'Pickup was updated.' }
        format.json { render :index, status: :ok, location: @pickups }
      else
        format.html { render :edit }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickups/coordinates/1
  # PATCH/PUT /pickups/coordinates/1.json
  def update_coordinates
    respond_to do |format|
      if @pickup.update(pickup_params)
        format.html { redirect_to pickup_url(@pickup), notice: 'Pickup coordinates were updated.' }
        format.json { render :index, status: :ok, location: @pickups }
      else
        format.html { render :edit }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickups/1
  # DELETE /pickups/1.json
  def destroy
    @pickup.destroy
    respond_to do |format|
      format.html { redirect_to pickups_url, notice: 'Pickup was destroyed.' }
      format.json { head :no_content }
    end
  end

  # Helper
  def can_edit(user_id)
    user = get_logged_user
    user.owner? or user.id == user_id
  end

  private
    def wallet_pickers
      wallet_id = get_logged_user.wallet.id
      User.where(active: true, wallet_id: wallet_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_pickup
      @pickup = Pickup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pickup_params
      params.require(:pickup).permit(:coin_id, :picked_at_date, :picked_at_time, :comments, :longitude, :latitude,  :location)
    end

    def pickup_coordinates_params
      params.require(:pickup).permit(:longitude, :latitude, :location)
    end
end
