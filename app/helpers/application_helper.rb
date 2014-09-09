module ApplicationHelper
  def current_user
    current_landlord || current_tenant
  end

  def resource_name
    current_user.class.name.downcase.pluralize
  end

end
