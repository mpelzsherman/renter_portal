class TenantServiceRequestController < ServiceRequestsController
  before_action :authenticate_tenant!

  def index
    @service_requests = ServiceRequest.where(tenant: current_tenant)
  end

  # GET /service_requests/new
  def new
    @service_request = ServiceRequest.new
    @service_request.tenant = current_tenant
    @service_request.property = current_tenant.property
  end

  # POST /service_requests
  # POST /service_requests.json
  def create
    @service_request = ServiceRequest.new(service_request_params)
    @service_request.tenant = current_tenant
    @service_request.property = current_tenant.property

    respond_to do |format|
      if @service_request.save
        format.html { redirect_to tenant_service_requests_path, notice: 'Service request was successfully created.' }
        format.json { render :show, status: :created, location: @service_request }
        ServiceRequestsMailer.send_new_service_request_email(@service_request, @current_user.full_name, app_base_url).deliver
      else
        format.html { render :new }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_requests/1
  # PATCH/PUT /service_requests/1.json
  def update
    if @service_request.update(service_request_params)
      redirect_to tenant_service_requests_path, notice: 'Service request was successfully updated.'
      ServiceRequestsMailer.send_update_service_request_email(@service_request, current_user.full_name, app_base_url).deliver
    else
      render :edit
    end
  end

  def set_current_user
    @current_user = current_tenant
  end

end