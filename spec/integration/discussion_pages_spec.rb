describe 'the initial user experience' do
  before :all do
  	@user = FactoryGirl.create(:user)
  end

  before :each do
    visit root_path
		click_link 'Login'
    
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'aeiouyy'
    click_button 'Sign in'
	end


	context 'the page that a user sees upon login' do
	  it 'has a new discussion field' do
	    page.should have_button 'Create new discussion'
	  end
	end

	context 'the page that a user seeds after submitting a new question' do
		it 'shows the question that they submitted' do
			fill_in 'discussion_question', with: "How do you feel about #{Faker::AddressUS.state}?"
			click_button 'Create new discussion'

			save_and_open_page

			page.should have_content 'How do you feel about'
		end
	end
end