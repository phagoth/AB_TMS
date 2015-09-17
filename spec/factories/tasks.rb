FactoryGirl.define do
  factory :task do
    title         "New Task"
    description   "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur a, deserunt mollitia, vitae dicta sequi?"
    priority      5
    due_date      Time.now + 10
    is_completed  false

    trait :done do
      title       "Old Task"
      is_completed   true
    end
  end
end