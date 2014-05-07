class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end
end
