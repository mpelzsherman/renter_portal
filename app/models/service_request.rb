class ServiceRequest < ActiveRecord::Base
  extend Enumerize

  belongs_to :tenant
  belongs_to :property

  enumerize :status, in: [:new, :in_progress, :resolved], default: :new

end
