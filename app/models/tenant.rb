class Tenant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  belongs_to :account
  belongs_to :property
  accepts_nested_attributes_for :account

  def self.find_for_facebook_oauth(auth)
    user = Tenant.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = Tenant.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        account = Account.create(
          first_name: auth.extra.raw_info.first_name,
          last_name: auth.extra.raw_info.last_name
        )
        Tenant.create(account:    account,
                      provider:   auth.provider,
                      uid:        auth.uid,
                      email:      auth.info.email,
                      photo_url:  auth.info.image,
                      password: Devise.friendly_token[0, 20])
      end

    end
  end
end
