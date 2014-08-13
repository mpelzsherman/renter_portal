class AddServiceRequestComments < ActiveRecord::Migration
  def change
    create_table :service_request_comments do |t|
      t.belongs_to :service_request, index: true
      t.text :content
      t.timestamps
    end
  end
end
