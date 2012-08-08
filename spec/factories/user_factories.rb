FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Lorem.words.join
  end
end