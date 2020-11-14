FactoryBot.define do
  factory :support do
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :request
  end
end
