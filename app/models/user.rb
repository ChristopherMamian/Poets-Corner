class User < ActiveRecord::Base
  has_many :stories
  has_many :comments

  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "that is not a valid email"}
end