class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.belongs_to :properties
      t.integer :account_id
      t.string :stripe_customer_id

      t.timestamps
    end
  end
end
