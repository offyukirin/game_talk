class AddUserIdToPostTags < ActiveRecord::Migration[6.1]
  def change
    add_column :post_tags, :user_id, :integer
  end
end
