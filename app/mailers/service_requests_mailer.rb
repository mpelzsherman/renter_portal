class ServiceRequestsMailer < ActionMailer::Base
  def send_new_service_request_email(request, name)
    send_email(request, name)
  end

  def send_update_service_request_email(request, name)
    send_email(request, name)
  end

  def send_delete_service_request_email(request, name)
    send_email(request, name)
  end

  def send_email(request, name)
    @request = request
    @name = name
    recipients = [request.tenant.email, request.property.landlord.email].join(',')
    mail from:     'info@renter_portal.com',
         to:       recipients,
         subject:  "Service Request for #{request.property.name}"
  end
end
