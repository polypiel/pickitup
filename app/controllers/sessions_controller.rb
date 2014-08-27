class SessionsController < ApplicationController
  skip_before_action :authorise

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user and user.active and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:wallet_id] = user.wallet_id
      redirect_to dashboard_url
    else
      redirect_to login_url, alert: "Invalid user/password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:wallet_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
