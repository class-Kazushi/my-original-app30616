FactoryBot.define do
  factory :apply do
    phone_num { '08022223333' }
    reason    {Faker::Lorem.sentence}
    question  {Faker::Lorem.sentence}
    association :user
    association :request
  end
end
