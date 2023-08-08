FactoryBot.define do
  factory :memo do
    text          { "test" }

    association :user
  end
end
