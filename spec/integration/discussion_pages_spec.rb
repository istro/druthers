require 'spec_helper'

describe 'During the initial user experience,' do
  before :each do
    create_user_and_sign_in
	end


	context 'the page that a user sees upon login' do
	  it 'has a new discussion field' do
      page.should have_button 'Create new discussion'
	  end
	end

	context 'the page that a user sees after submitting a new question' do
		it 'shows the question that they submitted' do
      fill_in 'discussion_question', with: "How do you feel about ?"
			click_button 'Create new discussion'
			page.should have_content 'How do you feel about'
		end
	end
end
