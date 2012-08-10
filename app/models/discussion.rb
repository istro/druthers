class Discussion < ActiveRecord::Base
  attr_accessible :question
  belongs_to :user
  has_many :solutions
  validates :question, presence: true
end
