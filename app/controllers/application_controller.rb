class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def app_base_url
    result = "#{request.protocol}#{request.host}"
    result << ":#{request.port}" if request.port != 80
    result
  end

  def current_user
    current_landlord || current_tenant
  end

end
