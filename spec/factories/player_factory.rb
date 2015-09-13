FactoryGirl.define do
  factory :player do
    sequence(:nickname) { |n| "nickname#{n}"}
    sequence(:first_name) { |n| "first_name#{n}"}
    sequence(:last_name) { |n| "last_name#{n}"}
  end
end
