class AddManagementCompanyToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :management_company, :string
  end
end
