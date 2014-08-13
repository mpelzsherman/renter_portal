class ServiceRequestsMailer < ActionMailer::Base
  def send_new_service_request_email(service_request, tenant_name, app_root)
    send_email(service_request, tenant_name, app_root)
  end

  def send_update_service_request_email(service_request, tenant_name, app_root)
    send_email(service_request, tenant_name, app_root)
  end

  def send_delete_service_request_email(service_request, tenant_name, app_root)
    send_email(service_request, tenant_name, app_root)
  end

  def send_email(service_request, tenant_name, app_root)
    @service_request = service_request
    @tenant_name = tenant_name
    @app_root = app_root
    recipients = [service_request.tenant.email, service_request.property.landlord.email].join(',')
    mail from:     'info@renter_portal.com', # TODO - make this an ENV variable
         to:       recipients,
         subject:  "Service Request for #{service_request.property.name}"
  end
end
