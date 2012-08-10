require 'spec_helper'

describe 'proposing a solution' do
  before :each do
    create_user_and_sign_in
    @discussion = FactoryGirl.create(:discussion, user: @user)
  end

  context "when a user is viewing a discussion" do
    it 'has a field to propose a new solution' do
      visit discussion_path(@discussion)
      page.should have_button 'Propose new solution'
    end
  end

  # context "when a user submits a solution" do
  #   it "redirects the user to the discussion page with the new solution" do
  #     visit discussion_path(@discussion)
  #     fill_in "Text", :with => "Whatever"
  #     click_button "Propose new solution"
  #     page.should have_content "Whatever"
  #   end
  # end
end
