class Account < ActiveRecord::Base
  #attr_accessible :first_name, :last_name, :street, :city, :state, :zip
  def full_name
    self.first_name + " " + self.last_name
  end
end
