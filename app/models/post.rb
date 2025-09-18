class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
end
