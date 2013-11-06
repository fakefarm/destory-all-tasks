# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'dave@volcom.com'
    password 'letmein'
  end
end
