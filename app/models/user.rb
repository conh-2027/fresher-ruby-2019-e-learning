class User < ApplicationRecord
  attr_accessor :remember_token
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

  def authenticated? attribute, token
    digest = self.send("#{attribute}_digest")
    return false unless digest
    BCrypt::Password.new(digest).is_password? token
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def forget
    update remember_digest: nil
  end

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private

  def downcase_email
    email.downcase!
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
