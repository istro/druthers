require 'spec_helper'

describe Discussion do
  it {should belong_to :user}
  it {should validate_presence_of :question}
  it {should ensure_length_of(:question).is_at_most(150) }
  it {should have_many :user_discussions}
end
