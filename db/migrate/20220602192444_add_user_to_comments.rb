class AddUserToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :AuthorId
    add_index :comments, :AuthorId
  end 
end
