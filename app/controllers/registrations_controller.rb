class RegistrationsController < Devise::RegistrationsController

  def create
    super

    property_id = params['property']['property_id']
    if resource_name == :tenant && property_id.present?
      resource.property = Property.find(property_id)
      begin
        resource.save
      rescue ActiveRecord::RecordNotFound
        Rails.logger.debug "no Property found for id "
      end
    end
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, :unit, property: [:property_id], account_attributes: [:first_name, :last_name, :street, :city, :state, :zip]]
    params.require(resource_name).permit(allow)
  end

end