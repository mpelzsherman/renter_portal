class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :account_id
      t.string :landlord_id

      t.timestamps
    end
  end
end
