class Learning < ApplicationRecord
  belongs_to :user
  belongs_to :word
  delegate :name, :meaning, :pronounce, :example, to: :word, prefix: true
end
