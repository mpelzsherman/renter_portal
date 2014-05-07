class AddLandLordToTennant < ActiveRecord::Migration
  def change
    change_table(:tenants) do |t|
      t.belongs_to :landlords
    end
  end
end
