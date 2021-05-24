FactoryBot.define do
  factory :history_address do
    postal_code          { "111-1111" }
    regional_id          { 2 }
    municipality         { '市区町村' }
    address              { '番地' }
    phone_number         { "11111111111" }
    item_id              { 1 }
    user_id              { 1 }
    token                {"tok_abcdefghijk00000000000000000"}
  end
end