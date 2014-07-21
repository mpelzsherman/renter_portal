module ApplicationHelper
  def current_user
    current_landlord || current_tenant
  end
end
