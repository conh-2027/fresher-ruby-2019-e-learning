class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :learnings, dependent: :destroy
  has_many :active_relationships, class_name: Follower.name,
    foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships,class_name: Follower.name,
    foreign_key: "followed_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
end
