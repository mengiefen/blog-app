class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_by_one
  after_destroy :decrement_by_one

  def increment_by_one
    post.increment! :likes_counter
  end

  def decrement_by_one
    post.decrement :likes_counter
  end
end
