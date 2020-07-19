class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :purchase
  has_one :address
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }          
    validates :user
  
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :ship_from
    belongs_to_active_hash :transport_days

    with_options presence: true do
      validates :category
      validates :condition
      validates :delivery_fee
      validates :ship_from
      validates :transport_days
    end




end
