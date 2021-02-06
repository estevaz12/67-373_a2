FactoryBot.define do
  
  # TODO: fill in factory blueprint for children
  factory :child do
    first_name 'Alex'
    last_name 'Heimann'
    active true
  end

  # factory blueprint for tasks
  factory :task do
    name "Wash dishes"
    points 1
    active true
  end

  # factory blueprint for chores
  factory :chore do
    association :child
    association :task
    due_on 1.day.from_now.to_date
    completed false
  end
end