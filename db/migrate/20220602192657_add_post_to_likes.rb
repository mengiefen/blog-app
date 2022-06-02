class AddPostToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :posts, column: :PostId
    add_index :likes, :PostId
  end 
end
