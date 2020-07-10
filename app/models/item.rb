class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price,          format: { with: /\A3[0-9][0-9]|[1-9][0-9][0-9][0-9][0-9][0-9][0-9]+\z/, message: "300以上9,999,999以下の半角数字で入力してください" } 
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

    with_options numericality: { other_than: 1 } do
      validates :category
      validates :condition
      validates :delivery_fee
      validates :ship_from
      validates :transport_days
    end



end
