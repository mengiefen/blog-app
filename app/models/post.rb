class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :increment_by_one
  after_destroy :decrement_by_one

  def increment_by_one
    author.increment! :posts_counter
  end

  def decrement_by_one
    author.decrement! :posts_counter
  end

  def recent_comment
    comments.order(created_at: :desc).first(6)
  end
end
