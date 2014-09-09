class ServiceRequest < ActiveRecord::Base
  extend Enumerize

  belongs_to :tenant
  belongs_to :property
  has_many :comments, class_name: "ServiceRequestComment"

  enumerize :status, in: [:new, :in_progress, :resolved], default: :new

end
