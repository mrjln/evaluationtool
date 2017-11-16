#Def file: Factory for our User model
FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
