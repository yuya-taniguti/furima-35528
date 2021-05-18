FactoryBot.define do
  factory :item do
    name                 { '商品名' }
    description          { '商品説明' }
    category_id          { 2 }
    state_id             { 2 }
    postage_id           { 2 }
    regional_id          { 2 }
    shipping_data_id     { 2 }
    price                { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
