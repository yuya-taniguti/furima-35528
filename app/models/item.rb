class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price

    with_options format: { with: (/\d/) } do
      validates :price
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :postage_id
      validates :regional_id
      validates :shipping_data_id
    end
  end
  
  validates_inclusion_of :price, in: 300..9_999_999
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :regional
  belongs_to :state
  belongs_to :shipping_data
end