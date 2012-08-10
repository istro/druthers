class UserDiscussion < ActiveRecord::Base
  attr_accessible
  belongs_to :user
  belongs_to :discussion
end
