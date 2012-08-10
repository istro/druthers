require 'spec_helper'

describe Discussion do
  it {should belong_to :user}
  it {should validate_presence_of :question}
  it {should have_many :user_discussions}
end
