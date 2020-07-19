class AddressPurchase

  include ActiveModel::Model
  attr_accessor :zipcode, :city, :address_line, :phone_number, :building, :prefecture_id, :user_id, :item_id, :token
  
  # addressに関するバリデーション
  with_options presence: true do
    validates :zipcode, format: { with:/\A\d{3}[-]\d{4}\z/, message: "ハイフン含む7桁の半角数字で入力してください"}
    validates :city
    validates :address_line
    validates :prefecture_id
    validates :phone_number, format: { with:/\A\d{10,11}\z/, message: "ハイフンなしの半角数字で入力してください"}
    validates :user_id
    validates :item_id

  end

  # purchaseに関するバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  def save
    Address.create(zipcode: zipcode, city: city, address_line: address_line, prefecture_id: prefecture_id, phone_number: phone_number, building: building, item_id: item_id, user_id: user_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end

end