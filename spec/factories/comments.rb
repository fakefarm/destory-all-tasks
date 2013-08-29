# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    entry "MyText"
    tags "MyString"
  end
end
