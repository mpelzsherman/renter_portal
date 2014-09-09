class ServiceRequestComment < ActiveRecord::Base
  belongs_to :service_request
  belongs_to :commentable, polymorphic: true
end
