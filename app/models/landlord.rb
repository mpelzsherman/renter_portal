class Landlord < ActiveRecord::Base
  include User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :account
  accepts_nested_attributes_for :account
  has_many :tenants
  has_many :properties
  has_many :service_request_comments, as: :commentable
end
