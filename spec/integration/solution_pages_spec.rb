require 'spec_helper'

describe 'proposing a solution' do
  include Devise::TestHelpers
  before :each do
    p User.all
    p ENV["RAILS_ENV"]
    @user = FactoryGirl.create(:user)
    # @user = FactoryGirl.create(:user)
    # visit root_path
    # click_link 'Login'
    # fill_in 'Email', with: @user.email
    # fill_in 'Password', with: 'password'
    # click_button 'Sign in'

    # @discussion = FactoryGirl.create(:discussion, user: @user)
  end

  context "when a user is viewing a discussion" do
    it 'has a field to propose a new solution' do
      sign_in @user
      @discussion = FactoryGirl.create(:discussion, user: user)
      visit discussion_path(@discussion)
      page.should have_button 'Propose new solution'
    end
  end

  # context "when a user submits a solution" do
  #   it "redirects the user to the discussion page with the new solution" do
  #     save_and_open_page
  #     fill_in "Text", :with => "Whatever"
  #     click_button "Propose new solution"
  #     page.should have_content "Whatever"
  #   end
  # end
end
