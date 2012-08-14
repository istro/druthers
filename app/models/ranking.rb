class Ranking < ActiveRecord::Base
  belongs_to :user
  belongs_to :solution
  validates :value, presence: true
end
