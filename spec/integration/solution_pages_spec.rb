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
      fill_in "Suggest your solution:", with: "I propose ice cream"
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
    before :each do
      visit discussion_path(@discussion)
      click_link 'comments'
    end
    it "provides a comment form" do
      page.should have_button "Submit"
    end

    it "her comment submission appears on the page" do
      fill_in "New Comment", with: "Great solution!"
      click_button "Submit"
      page.should have_content "Great solution!"
    end

    it "every comment provides a 'reply' link" do
      fill_in "New Comment", with: "Great solution!"
      click_button "Submit"
      save_and_open_page

      page.all(:css, 'comment').should have_link "reply"
    end
  end
end