FactoryBot.define do
  factory :request do
    title         { 'あかさたなはまやらわ'}
    category_id   {Faker::Number.between(from: 2, to: 14)}
    content       {Faker::Lorem.sentence}
    url           {Faker::Lorem.sentence}
    job           {Faker::Lorem.sentence}
    want          {Faker::Lorem.sentence}
    period        { '1990-9-19' }
    reword        {Faker::Lorem.sentence}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    city          {Faker::Lorem.sentence}
    people        {Faker::Number.between(from: 0, to: 999)}
    donation      {Faker::Number.between(from: 0, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
