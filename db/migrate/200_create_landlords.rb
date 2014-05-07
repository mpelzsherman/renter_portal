class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.integer :account_id

      t.timestamps
    end
  end
end
