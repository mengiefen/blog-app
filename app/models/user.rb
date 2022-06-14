class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 },
                            numericality: { only_integer: true }

  Roles = %i[admin default]

  def is?(requested_role)
    role == requested_role.to_s
  end

  def admin?
    role == 'admin'
  end

  def present?
    id != nil
  end

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
