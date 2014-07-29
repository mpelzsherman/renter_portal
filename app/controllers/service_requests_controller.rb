class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user

  # GET /service_requests/1
  # GET /service_requests/1.json
  def show
  end

  # GET /service_requests/1/edit
  def edit
  end

  # PATCH/PUT /service_requests/1
  # PATCH/PUT /service_requests/1.json
  def update
    respond_to do |format|
      binding.pry
      if @service_request.update(service_request_params)
        format.html { redirect_to tenant_service_requests_path, notice: 'Service request was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_request }
        ServiceRequestsMailer.send_update_service_request_email(@service_request, current_user.account.full_name).deliver
      else
        format.html { render :edit }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_requests/1
  # DELETE /service_requests/1.json
  def destroy
    ServiceRequestsMailer.send_delete_service_request_email(@service_request, current_user.account.full_name).deliver
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

  def set_current_user
    # subclasses must override
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_request_params
    params.require(:service_request).permit([:content, :status, :tenant_id])
  end
end
