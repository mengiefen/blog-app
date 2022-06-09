class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  after_save :increment_comment_count
  after_destroy :decrement_comment_count

  def increment_comment_count
    post.increment! :comments_counter
  end

  def decrement_comment_count
    post.decrement! :comments_counter
  end
end
