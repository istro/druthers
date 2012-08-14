require 'ffaker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    test_password = "password"
    password test_password
    password_confirmation test_password
  end

  factory :discussion do
    question Faker::Lorem.sentence
    user FactoryGirl.create :user
  end
   
  factory :solution do
    text "I propose #{Faker::Company.bs}."
    user FactoryGirl.create :user
    discussion FactoryGirl.create :discussion
  end
end
