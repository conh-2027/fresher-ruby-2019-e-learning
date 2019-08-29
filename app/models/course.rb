class Course < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy
  has_many :results, dependent: :destroy
  validates :name, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  has_one_attached :image

  delegate :name, to: :user, prefix: true, allow_nil: true

  COURSE_PARAMS = %i(name user_id image description).freeze
end
