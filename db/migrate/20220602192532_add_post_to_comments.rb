class AddPostToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :posts, column: :PostId
    add_index :comments, :PostId
  end 
end
