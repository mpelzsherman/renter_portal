class LandlordServiceRequestController < ServiceRequestsController
  before_action :authenticate_landlord!

  def index
    @service_requests = ServiceRequest.where(property: current_landlord.properties)
  end

  # PATCH/PUT /service_requests/1
  # PATCH/PUT /service_requests/1.json
  def update
    if @service_request.update(service_request_params)
      redirect_to landlord_service_requests_path, notice: 'Service request was successfully updated.'
      ServiceRequestsMailer.send_update_service_request_email(@service_request, current_user.full_name, app_base_url).deliver
    else
      render :edit
    end
  end

  def set_current_user
    @current_user = current_landlord
  end
end