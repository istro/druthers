class Discussion < ActiveRecord::Base
  attr_accessible :question
  belongs_to :user
  
end
