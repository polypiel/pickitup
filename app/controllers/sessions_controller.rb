class SessionsController < ApplicationController
  skip_before_action :authorise

  def new
    @login_page = true
    render :new, layout: 'public'
  end

  def create
    user = User.find_by(username: params[:username])
    if user and user.active and user.authenticate(params[:password])
      log_in user
      remember user

      redirect_to dashboard_url
    else
      redirect_to login_url, alert: "Invalid user/password"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url, notice: "Logged out"
  end
end
