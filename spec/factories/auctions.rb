FactoryGirl.define do
  factory :auction do

    association :user, factory: :user
    sequence(:title)              { Faker::Company.bs }
    sequence(:description)        { Faler::Loren.paragraph }
    sequence(:goal)               { 10 + rand(300) }
    sequence(:end_date)           { Time.now + 20.days }
    end
  end
