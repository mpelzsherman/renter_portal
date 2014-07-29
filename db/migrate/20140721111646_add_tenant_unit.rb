class AddTenantUnit < ActiveRecord::Migration
  def change
    add_column :tenants, :unit, :string
  end
end
