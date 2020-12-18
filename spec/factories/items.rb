FactoryBot.define do
  factory :item do
    name                 {"自伝本"}
    description_of_item  {"商品説明"}
    category_id          {3}
    product_condition_id {4}
    shipping_charges_id  {2}
    prefectures_id       {3}
    days_to_ship_id      {2}
    price                {2340}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
