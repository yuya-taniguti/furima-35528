FactoryBot.define do
  factory :history_address do
    postal_code          { '111-1111' }
    regional_id          { 2 }
    municipality         { '市区町村' }
    address              { '番地' }
    building_name        { '建物名' }
    phone_number         { '1111111111' }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
