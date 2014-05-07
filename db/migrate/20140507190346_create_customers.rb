class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :stripe_customer_id
      t.belongs_to :account
      t.timestamps
    end
  end
end
