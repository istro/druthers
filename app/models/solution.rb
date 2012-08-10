class Solution < ActiveRecord::Base
  attr_accessible :text

  belongs_to :discussion
  belongs_to :user

  validates :text, :presence => true
end
