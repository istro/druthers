require 'spec_helper'

# describe "commenting on a comment:" do
#   before :each do
#     create_user_and_sign_in
#     @discussion = FactoryGirl.create(:discussion, user: @user)
#     8.times.map {FactoryGirl.create(:solution, discussion: @discussion)}

#     visit discussion_path(@discussion)
#     click_link 'comments'

#     @body = "It works in #{Faker::AddressUS.state}!"
#     fill_in "New Comment", with: @body
#     click_button "Submit"
#   end

#   context "When a user is reading the comments on a solution," do
#     it "every comment provides a 'reply' link" do
#       page.all(:css, 'comment').should have_link "reply"
#     end

# #PASS ALL THESE, DOOD
#     it "he can see the parent comment as he is replying to it" do
#       click_link 'reply'
#       page.should have_content @body
#     end

#     it "he can reply to a comment" do
#       click_link 'reply'

#       new_body = "You can't get away with this in #{Faker::AddressUS.state}!"
#       fill_in "New Comment", with: new_body
#       click_button "Submit"

#       page.should have_content new_body
#     end
#   end
# end