class LandlordServiceRequestController < ServiceRequestsController
  before_action :authenticate_landlord!

  def index
    @service_requests = ServiceRequest.where(property: current_landlord.properties)
  end

  # GET /service_requests/1/edit
  def edit
    @service_request_comment = ServiceRequestComment.new(service_request:@service_request)
  end

  def set_current_user
    @current_user = current_landlord
  end
end