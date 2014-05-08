class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.belongs_to :tenant, index: true
      t.belongs_to :property, index: true
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
