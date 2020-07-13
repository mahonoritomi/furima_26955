class Address < ApplicationRecord
  belongs_to :user
  has_many :purchases

  with_options presence: true do
    validates :zipcode
    validates :city
    validates :address_line
    validates :phone_number
    validates :user

  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    validates :prefecture, presence: true



end
