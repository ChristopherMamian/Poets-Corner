class User < ActiveRecord::Base
  has_many :stories
  has_many :comments
  has_many :notifications
  has_many :friendships
  has_many :friends, :through => :friendships

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "that is not a valid email"}

  def authenticate(password)
    BCrypt::Password.new(self.password_hash) == password
  end
end