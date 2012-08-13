require 'spec_helper'

describe 'When a new user first logs in,' do
  before :each do
    create_user_and_sign_in
	end


	context 'the first page they see' do
	  it 'has a new discussion field' do
      page.should have_button 'Create new discussion'
	  end
	end

	context 'Discussions' do
    before :each do
      fill_in 'discussion_question', with: "How do you feel about Montana?"
      click_button 'Create new discussion'
    end

		it 'shows the discussion after it was created' do
			page.should have_content 'How do you feel about Montana?'
		end

    it "displays a list of user's discussions upon login" do
      email = @user.email
      click_link 'Logout'
      click_link 'Login'
      fill_in 'Email', with: email
      fill_in 'Password', with: 'password'
      click_button 'Sign in'
      page.should have_content 'How do you feel about Montana?'
    end

    it "goes to the discussion page upon clicking on discussion question in the list"
      # click on "how do you ...", should go to a page on which a button "propose a solution" can be found



    # it 'gives them a unique url they can share with others' do 
    #   page.should have_content 'Share this link with others to invite them to the discussion:'
    # end

    it 'gives them a unique url they can share with others' do 
      page.should have_content 'Share this link with others to invite them to the discussion:'
    end

	end
end

describe 'When a user first visits the discussion page,' do
  before :each do
    @discussion = FactoryGirl.create :discussion
  end

  context 'if they are not logged in' do
    it 'tells them they need to sign up or log in to participate' do
      visit discussion_path @discussion
      page.should have_content 'You need to sign in or sign up before continuing.'
    end
  end

  context 'if they are logged in' do
    it 'adds this discussion to their list of discussions' do
      create_user_and_sign_in
      visit discussion_path @discussion
      visit discussions_path
      page.should have_content @discussion.question
    end
  end
end