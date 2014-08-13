class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= current_user

    if user.kind_of? Landlord
      # define Landlord abilities here
    elsif user.kind_of? Tenant
      can :edit, :service_request
      can :delete, :service_request
    end
  end
end