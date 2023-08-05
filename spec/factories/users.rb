FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    code                  {123456}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, max_length:128)}
    password_confirmation {password}
  end
end
