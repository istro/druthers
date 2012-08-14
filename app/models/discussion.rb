class Discussion < ActiveRecord::Base
  attr_accessible :question
  belongs_to :user
  has_many :solutions
  has_many :user_discussions
  validates :question, presence: true
  has_many :rankings, through: :solutions
end
