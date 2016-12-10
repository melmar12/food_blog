class User < ActiveRecord::Base
  has_secure_password

  after_initialize :set_defaults, unless: :persisted?

  validates :first_name, presence: true,
    length: {minimum: 1, maximum: 30}
  validates :last_name, presence: true,
    length: {minimum: 1, maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
    presence: true, 
    uniqueness: {case_sensitive: false}, 
    length: {maximum: 105} ,
    format: {with: VALID_EMAIL_REGEX}

  validates :password, presence: true, 
    length: {minimum: 3, maximum: 30}

  has_many :posts, dependent: :destroy

  private
   def set_defaults
      self.admin ||= false
    end
end
