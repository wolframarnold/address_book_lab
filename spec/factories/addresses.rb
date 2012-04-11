# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    city "San Francisco"
    state "CA"
    street "123 Main"
    zip "12345"
    user
  end
end
