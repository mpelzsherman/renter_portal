class AddColumnsToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :provider, :string
    add_column :tenants, :uid, :string
    add_column :tenants, :photo_url, :string
  end
end
