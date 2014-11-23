class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :authorise
  helper_method :owner?

  # Helper
  def owner?
    get_logged_user.owner?
  end

  protected
    def authorise
      unless logged_in?
        redirect_to login_url, notice: "Please log in"
      end
    end
end
