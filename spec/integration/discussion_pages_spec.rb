require 'spec_helper'

describe 'When a user first logs in,' do
  before :each do
    create_user_and_sign_in
	end


	context 'the first page they see' do
	  it 'has a new discussion field' do
      page.should have_button 'Create new discussion'
	  end
	end

	context 'and submits a new question, what they see next' do
    before :each do
      fill_in 'discussion_question', with: "How do you feel about Montana?"
      click_button 'Create new discussion'
    end

		it 'shows the question that they submitted' do
			page.should have_content 'How do you feel about Montana?'
		end

    it 'gives them a unique url they can share with others' do 
      page.should have_content 'Share this link with others to invite them to the discussion:'
    end
	end
end


