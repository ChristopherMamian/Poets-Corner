class Friend < ActiveRecord::Base
  belongs_to :friendships
  belongs_to :user
  has_many :users, :through => :friendships
  # Remember to create a migration!
end