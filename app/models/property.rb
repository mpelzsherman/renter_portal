class Property < ActiveRecord::Base
  belongs_to :landlord
  has_many :tenants
end
