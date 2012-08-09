require 'ffaker'

FactoryGirl.define do
  factory :user do
  	email Faker::Internet.email
    password Faker::Lorem(3).join
  end

  factory :discussion do
    question "Where do we go for vacation?"
  end
end