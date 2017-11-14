FactoryGirl.define do
  factory :student do
    name              "A Test Name"
    batch              { build(:batch) }
  end
end
