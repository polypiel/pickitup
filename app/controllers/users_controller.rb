class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    # Finds only current wallet contributors
    @users = User.where(wallet_id: session[:wallet_id], role: User::ROLE_CONTRIBUTOR, active: true)
    @invitations = User.where(wallet_id: session[:wallet_id], role: User::ROLE_CONTRIBUTOR, active: false)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def profile
    @user = User.find_by(id: session[:user_id])
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
    @user.wallet_id = session[:wallet_id]
    @user.password = SecureRandom.hex(16)

    respond_to do |format|
      if @user.save
        # TODO send email
        format.html { redirect_to users_path, notice: 'An invitation was sent to #{@user.email}' }
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /signup
  def signup_new
    @user = User.find(params[:email])
    if not @user or @user.active or not @user.authenticate(params[:key])
      # error
    end
  end

  # POST /signup
  def signup
    @user.active = true
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to login_path, notice: 'Your user has been confirmed. Pleas sign in.' }
        format.json { render :show, status: :ok, location: location_path }
      else
        format.html { render :signup }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
