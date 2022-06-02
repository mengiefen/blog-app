class AddUserToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :AuthorId
    add_index :likes, :AuthorId
  end
end
