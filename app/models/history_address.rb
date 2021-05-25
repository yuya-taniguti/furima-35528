class HistoryAddress
  attr_accessor :token
  include ActiveModel::Model
  attr_accessor :postal_code, :regional_id, :municipality, :address, :phone_number, :building_name, :token, :item_id, :user_id
  
  with_options presence: true do
      validates :item_id
      validates :user_id
      validates :postal_code
      validates :municipality
      validates :address
      validates :phone_number
  end

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}

  with_options numericality: { other_than: 1 } do
    validates :regional_id
  end

  def save
    history = History.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, regional_id: regional_id, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, history_id: history.id)
  end

end