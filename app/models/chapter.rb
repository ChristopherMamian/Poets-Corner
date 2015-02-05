class Chapter < ActiveRecord::Base
  belongs_to :story
  has_many :comments

  validates :title, presence: true
end