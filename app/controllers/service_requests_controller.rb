class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_tenant!, only: [:index, :show, :new, :create, :destroy]
  before_action :authenticate_landlord!, only: [:index, :edit, :update, :show]

  def current_user
    @current_user = current_landlord || current_tenant
  end

  # GET /service_requests
  # GET /service_requests.json
  def index
    if current_user.kind_of? Landlord
      @service_requests = ServiceRequest.where(property: current_landlord.properties)
    elsif current_user.kind_of? Tenant
      @service_requests = ServiceRequest.where(tenant: current_tenant)
    else
      @service_requests = []
    end
  end

  # GET /service_requests/1
  # GET /service_requests/1.json
  def show
  end

  # GET /service_requests/new
  def new
    @service_request = ServiceRequest.new
    @service_request.tenant = current_tenant
    @service_request.property = current_tenant.property
  end

  # GET /service_requests/1/edit
  def edit
  end

  # POST /service_requests
  # POST /service_requests.json
  def create
    @service_request = ServiceRequest.new(service_request_params)
    @service_request.tenant = current_tenant
    @service_request.property = current_tenant.property

    respond_to do |format|
      if @service_request.save
        format.html { redirect_to @service_request, notice: 'Service request was successfully created.' }
        format.json { render :show, status: :created, location: @service_request }
      else
        format.html { render :new }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_requests/1
  # PATCH/PUT /service_requests/1.json
  def update
    respond_to do |format|
      if @service_request.update(service_request_params)
        format.html { redirect_to @service_request, notice: 'Service request was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_request }
      else
        format.html { render :edit }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_requests/1
  # DELETE /service_requests/1.json
  def destroy
    @service_request.destroy
    respond_to do |format|
      format.html { redirect_to service_requests_url, notice: 'Service request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_service_request
    @service_request = ServiceRequest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_request_params
    params.require(:service_request).permit([:content, :status, :tenant_id])
  end
end
