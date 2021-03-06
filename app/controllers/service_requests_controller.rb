class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user

  # GET /service_requests/1
  # GET /service_requests/1.json
  def show
  end

  # GET /service_requests/1/edit
  def edit
    @comment = ServiceRequestComment.new
  end

  # DELETE /service_requests/1
  # DELETE /service_requests/1.json
  def destroy
    ServiceRequestsMailer.send_delete_service_request_email(@service_request, current_user.full_name, app_base_url).deliver
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
