FactoryBot.define do
  factory :item do
    # image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpg')), filename: 'test.jpg', content_type: 'image/jpg')
    end
    name {"本"}
    explanation {"先月買いました"}
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    ship_from_id {2}
    transport_days_id {2}
    price {1000}
    user
    
  end

  factory :item_noimage, class: Item do
    name {"本"}
    explanation {"先月買いました"}
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    ship_from_id {2}
    transport_days_id {2}
    price {1000}
    user
    
  end
end