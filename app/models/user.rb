class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  # follows I started
  has_many :passive_follows,
   class_name: "Follow",
   foreign_key: "followee_id",
   dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  # follows where I am being followed
  has_many :active_follows,
    class_name: "Follow",
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :followees, through: :active_follows, source: :followee

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
end
