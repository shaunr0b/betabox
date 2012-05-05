# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_group do
    name "MyString"
    slug "MyString"
    description "MyText"
    parent_id 1
  end
end
