class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorise, only: [:signup_new, :signup]

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
    @current_user = @user.id == session[:user_id]
  end

  def profile
    @user = User.find(session[:user_id])
    @current_user = true
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
    # Only the current user can update theirself
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

  def update_picture
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
      puts @user
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
    end
end
