class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  with_options presence: true do
    validates :text
    validates :user
    validates :item
  end
  
end
