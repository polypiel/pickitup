class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorise, only: [:signup_new, :signup]

  # GET /users
  # GET /users.json
  def index
    # Finds only current wallet contributors
    wallet_id = get_logged_user.wallet.id
    @users = User.where(wallet_id: wallet_id, role: User::ROLE_CONTRIBUTOR, active: true)
    @invitations = User.where(wallet_id: wallet_id, role: User::ROLE_CONTRIBUTOR, active: false)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @current_user = @user.id == session[:user_id]

    profile_queries
  end

  def profile
    @user = User.find(session[:user_id])
    @current_user = true
    profile_queries
    
    render "show"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.active = false
    @user.role = User::ROLE_CONTRIBUTOR
    @user.wallet_id = get_logged_user.wallet.id
    @user.password = SecureRandom.hex(16)

    respond_to do |format|
      if @user.save
        owner = User.find(session[:user_id])
        InvitationNotifier.invite(owner, @user).deliver

        format.html { redirect_to users_path, notice: "An invitation was sent to #{@user.email}" }
        format.json { render :show, status: :created, location: users_path }
      else
        format.html { render :new }

        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # TODO: Only the current user can update theirself
    update_type = params[:user][:update_type]
    params[:user].delete(:update_type)

    puts update_type
    puts params[:user][:username]
    puts params[:user][:password]

    if update_type == "username" and params[:user][:username].blank?
      @user.errors[:username] << "can't be empty"
      render :edit
    elsif update_type == "password" and params[:user][:password].empty?
      @user.errors[:password] << "can't be empty"
      render :edit
    else
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # TODO An contributor can't delete other users
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /signup
  def signup_new
    # TODO only owner
    @error = true

    if session[:user_id]
      respond_to do |format|
        format.html { redirect_to dashboard_path , notice: 'You should first log out.' }
      end
    end

    if params[:u] and params[:p]
      @user = User.find_by(email: params[:u], active: false, password_digest: URI.decode(params[:p]))
      if @user
        @error = false
      end
    end

    if @error
      respond_to do |format|
        format.html { redirect_to :login, alert: 'Something wrong happened.' }
      end
    else
      @login_page = true
      respond_to do |format|
        format.html { render :signup_new, layout: 'public' }
      end
    end
  end

  # POST /signup
  def signup
    # Only owner
    @user = User.find_by(email: params[:email])
    @user.active = true
    respond_to do |format|
      if @user.update(params.permit(:username, :password, :password_confirmation))
        format.html { redirect_to login_path, notice: 'Your user has been confirmed. Please sign in.' }
      else
        @login_page = true
        format.html { render :signup_new, layout: 'public', email: params[:email]  }
      end
    end
  end


  private
    def profile_queries
      @coins = Pickup.where(picker_id: @user.id).count
      @money = Pickup.where(picker_id: @user.id).joins(:coin).sum(:value)
      @last_pickups = Pickup.where(picker_id: @user.id).order(picked_at: :desc).limit(3)

      wallet_id = get_logged_user.wallet.id
      @years = Pickup.pluck('DISTINCT year').sort.reverse
      @year = (params['year'] || @years.max).to_i
      @top_users = ActiveRecord::Base.connection.execute("
        SELECT u.id, u.username, count(u.id) AS coins , sum(c.value) AS value
        FROM users u
        JOIN pickups p ON p.picker_id = u.id
        JOIN coins c ON p.coin_id = c.id
        WHERE u.wallet_id = #{wallet_id} AND p.year = #{@year}
        GROUP BY u.id
        ORDER BY coins DESC
      ")
      all = Pickup.where(wallet_id: wallet_id)
      @pickups_by_year = year_pickups all #all.group(:year).count
      @users = @top_users.map { |u| u['username']}
    end

    def year_pickups all
      pickups_by_year = {}
      pickups_by_year_raw = all.group_by { |p| "#{p.picker.username}-#{p.year}" }
      pickups_by_year_raw.each do |k, v|
        user, year = k.split "-"
        pickups_by_year[user] = {} unless pickups_by_year[user]
        pickups_by_year[user][year] = v.size
      end
      pickups_by_year
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
