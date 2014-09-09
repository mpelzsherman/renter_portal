class ServiceRequestComment < ActiveRecord::Base
  belongs_to :service_request
  belongs_to :commentable, polymorphic: true

  default_scope { order('created_at ASC') }
end
