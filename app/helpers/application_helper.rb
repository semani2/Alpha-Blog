module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Turning the current_user method to a boolean
    !!current_user
  end
end
