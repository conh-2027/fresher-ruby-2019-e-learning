class Question < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy
  validates :question, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true

  delegate :name, to: :word, prefix: true, allow_nil: true
end
