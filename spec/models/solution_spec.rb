require 'spec_helper'

describe Solution do
  it { should belong_to :discussion }
  it { should belong_to :user }
  it { should validate_presence_of :text }
end
