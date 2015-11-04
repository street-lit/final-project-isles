class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  skip_before_filter :authenticate_user, only: [:new, :create]
  before_action :current_user, :new_message

  def new_message
    @new_message = Message.new
  end

  def authenticate_user
    unless user_logged_in?
      redirect_to new_login_path
    end
  end

  def current_user
    if user_logged_in?
      @current_user ||= User.find(session[:logged_in_users_id])
    end
  end

  def user_logged_in?
    session[:logged_in_users_id].present?
  end
  helper_method :user_logged_in?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(home_path || root_path)
    end
end
