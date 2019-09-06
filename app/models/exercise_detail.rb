class ExerciseDetail < ApplicationRecord
  belongs_to :exercise
  belongs_to :question
end
