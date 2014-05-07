class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, account_attributes: [:first_name, :last_name, :street, :city, :state, :zip]]
    params.require(resource_name).permit(allow)
  end

end