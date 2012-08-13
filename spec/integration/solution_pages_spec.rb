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

  context "when a user submits a solution" do
    it "redirects the user to the discussion page with the new solution" do
      visit discussion_path(@discussion)
      fill_in "Suggest your solution:", :with => "I propose ice cream"
      click_button "Propose new solution"
      page.should have_content "I propose ice cream"
    end
  end
end

describe "commenting on a solution" do
  before :each do
    create_user_and_sign_in
    @discussion = FactoryGirl.create(:discussion, user: @user)
    @solutions  = 8.times.map {FactoryGirl.create(:solution, discussion: @discussion)}
    @solution = @solutions.first
  end

  context "when a user views all solutions" do
    it "provides a comment link" do
      visit discussion_path(@discussion)
      page.should have_link 'comments'
    end
  end

  context "when a user views a single solution" do
    it "provides a comment form" do
      visit discussion_path(@discussion)
      click_link 'comments'
      page.should have_button "Submit"
    end
  end
end