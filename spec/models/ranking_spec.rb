require 'spec_helper'

describe Ranking do
  it { should belong_to :solution }
  it { should belong_to :user }
  it { should validate_presence_of :value }
end