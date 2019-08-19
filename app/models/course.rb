class Course < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy
  has_many :results, dependent: :destroy
end
