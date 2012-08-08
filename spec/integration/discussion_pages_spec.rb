describe 'the initial user experience' do
  before :all do
  	@user = FactoryGirl.create(:user)
    
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
			page.should have_button 'Create new discussion'
		end
	end
end