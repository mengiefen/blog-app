class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  after_save :increment_post_count
  after_destroy :decrement_post_count

  def increment_post_count
    author.increment! :posts_counter
  end

  def decrement_post_count
    author.decrement! :posts_counter
  end

  def recent_comment
    comments.order(created_at: :desc).first(6)
  end
end
