FactoryBot.define do
  factory :address_purchase do
    zipcode {"123-4567"}
    prefecture_id {3}
    city {"文京区"}
    address_line {"向ケ丘1-12-8"}
    phone_number {"08012345678"}
    user_id {3}
    item_id {3}
  end

end