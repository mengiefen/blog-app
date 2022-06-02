class AddUserToPosts < ActiveRecord::Migration[7.0]
    def change
      add_foreign_key :posts, :users, column: :AuthorId
      add_index :posts, :AuthorId
    end 
end
