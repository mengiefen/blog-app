class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
