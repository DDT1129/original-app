FactoryBot.define do
  factory :situation do
    genre_id      { Faker::Number.between(from: 2, to: 3) }
    association :user
  end
end
