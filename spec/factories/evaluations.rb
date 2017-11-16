FactoryGirl.define do
  factory :evaluation do
    student { build(:student) }
    evaluation_date "2017-11-14"
    color "purple"
  end
end
