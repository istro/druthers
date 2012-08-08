require 'ffaker'

FactoryGirl.define do
  factory :user do
  	email Faker::Internet.email
    password "aeiouyy"
    password_confirmation "aeiouyy"
  end

  factory :discussion do
    question "Where do we go for vacation?"
  end
end