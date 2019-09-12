class Answer < ApplicationRecord
  belongs_to :question
  scope :is_corrects, ->{where is_correct: true}
end
