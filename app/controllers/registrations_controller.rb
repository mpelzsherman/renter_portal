class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    allow = [:email, :password, :password_confirmation, account: [:first_name, :last_name, :street, :city, :state, :zip]]
    params.require(resource_name).permit(allow)
  end

end