class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.integer :account_id
      t.integer :landlord_id
      t.string :stripe_customer_id

      t.timestamps
    end
  end
end
