class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  after_save :increment_by_one
  after_destroy :decrement_by_one

  def increment_by_one
    post.increment! :comments_counter
  end

  def decrement_by_one
    post.decrement! :comments_counter
  end
end
