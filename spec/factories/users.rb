FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1234abcd' }
    password_confirmation {password}
    family_name           { 'あア阿' }
    first_name            { 'いイ井' }
    family_kana           { 'アアア' }
    first_kana            { 'イイイ' }
    gender_id             {Faker::Number.between(from: 2, to: 3)}
    age                   {Faker::Number.between(from: 1, to: 99)}
    occupation_id         {Faker::Number.between(from: 2, to: 10)}
    ability               {Faker::Lorem.sentence}
    introduction          {Faker::Lorem.sentence}
  end
end