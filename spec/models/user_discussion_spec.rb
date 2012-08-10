require 'spec_helper'

describe UserDiscussion do
  it {should belong_to :user}
  it {should belong_to :discussion}
end
