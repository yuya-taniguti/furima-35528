FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    encrypted_password    {password}
    last_name             {"京都"}
    last_name_k           {"キョウト"}
    first_name            {"太郎"}
    first_name_k          {"タロウ"}
    birthday_year         {"1930-01-01"}
  end
end