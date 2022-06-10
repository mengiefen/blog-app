class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_like_count
  after_destroy :decrement_like_count

  def increment_like_count
    post.increment! :likes_counter
  end

  def decrement_like_count
    post.decrement! :likes_counter
  end
end
