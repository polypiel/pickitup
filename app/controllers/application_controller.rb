class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorise
  helper_method :owner?

  def get_logged_user
    User.find(session[:user_id])
  end

  # Helper
  def owner?
    get_logged_user.owner?
  end

  protected
    def authorise
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
