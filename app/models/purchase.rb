class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :address

  with_options presence: true do
    validates :user
    validates :item
    validates :address
  end
  
end
