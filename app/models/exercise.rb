class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :questions, dependent: :destroy
  has_many :exercise_details, dependent: :destroy
end
