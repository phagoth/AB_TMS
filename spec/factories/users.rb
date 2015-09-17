FactoryGirl.define do
  factory :user do
    first_name  "John"
    last_name   "Doe"
    email       "johndoe@mailinator.com"
    password    "12345678"
  end
end
