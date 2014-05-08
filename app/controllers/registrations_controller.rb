class RegistrationsController < Devise::RegistrationsController

  def create
    super

    if resource_name == :tenant && params['property']
      resource.property = Property.find(params['property']['property_id'])
      resource.save
    end
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, property: [:property_id], account_attributes: [:first_name, :last_name, :street, :city, :state, :zip]]
    params.require(resource_name).permit(allow)
  end

end