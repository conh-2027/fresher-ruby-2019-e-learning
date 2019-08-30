class Question < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy
  validates :question, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true
  QUESTION_PARAMS = [:question, :word_id,
    answers_attributes: %i(id content is_correct)].freeze
  delegate :name, to: :word, prefix: true, allow_nil: true
end
