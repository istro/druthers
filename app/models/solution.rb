class Solution < ActiveRecord::Base
  attr_accessible :text

  belongs_to :discussion
  belongs_to :user
  
  has_many :comments, as: :commentable
  has_many :rankings

  validates :text, :presence => true
end
