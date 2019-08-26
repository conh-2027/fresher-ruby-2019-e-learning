class User < ApplicationRecord
  before_save :downcase_email
  
  has_many :results, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :learnings, dependent: :destroy
  has_many :active_relationships, class_name: Follower.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Follower.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  VALID_EMAIL_REGEX = Settings.users.email.regex
  VALID_PASSWORD_REGEX = Settings.users.password.regex
  
  validates :name, presence: true,
    length: {minimum: Settings.users.name.min_length,
    maximum: Settings.users.name.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.users.email.max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: Settings.users.password.min_length,
    maximum: Settings.users.password.max_length},
    format: {with: VALID_PASSWORD_REGEX}, allow_nil: true
  
  has_one_attached :avatar
  
  USER_PARAMS = %i(name email avatar password password_confirmation)
  
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
