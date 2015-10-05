FactoryGirl.define do
  factory :user do
    sequence(:email)     { Faker::Internet.email }
    password             Faker::Internet.password
  end
end
