class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_user, :logged_in?

  def app_base_url
    result = "#{request.protocol}#{request.host}"
    result << ":#{request.port}" if request.port != 80
    result
  end

  def current_user
    current_landlord || current_tenant
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      redirect_to root_path
    end
  end

end
