class Address < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :purchases
end
