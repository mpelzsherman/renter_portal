class AddCommentableToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_request_comments, :commentable_id, :integer
    add_column :service_request_comments, :commentable_type, :string
  end
end
