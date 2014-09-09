class ServiceRequestCommentsController < ApplicationController
  before_action :require_user

  def create
    service_request = ServiceRequest.find(comment_params[:service_request_id])
    @comment = current_user.service_request_comments.new(service_request: service_request,
                                                 content: comment_params[:content])
    if @comment.save
      notice = "Comment was created."
      if current_tenant
        redirect_to tenant_service_request_path(current_user.id, service_request.id), notice: notice
      elsif current_landlord
        redirect_to landlord_service_request_path(current_user.id, service_request.id), notice: notice
      end
    else
      notice = "There was an error creating your comment"
      if current_tenant
        render 'tenant/service_requests/edit', notice: notice
      elsif current_landlord
        render 'landlord/service_requests/edit', notice: notice
      end
    end
  end

  private

  def comment_params
    params.require(:service_request_comment).permit(:content, :user_id, :service_request_id)
  end

end
