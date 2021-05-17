class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,             presence: true
  validates :name,              presence: true
  validates :description,       presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :state_id,          numericality: { other_than: 1 }
  validates :postage_id,        numericality: { other_than: 1 }
  validates :regional_id,       numericality: { other_than: 1 }
  validates :shipping_data_id,  numericality: { other_than: 1 }
  validates :price,             presence: true
  validates :price,             numericality: { in: 300..9999999 }
  validates :price,             format: { with: (/\d/) }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :regional
  belongs_to :state
  belongs_to :shipping_data
end