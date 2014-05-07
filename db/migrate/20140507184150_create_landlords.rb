class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :account_id

      t.timestamps
    end
  end
end
