class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :name
    validates :description_of_item
  end
  with_options presence: true, numericality:{ other_than: 1 } do 
    validates :category_id 
    validates :product_condition_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :days_to_ship_id
  end
    validates :price, numericality:{ greater_than: 299, less_than: 10_000_000 }
    
    validates :price, format: { with: /\A[0-9]+\z/,message: "半角数字のみ使えます" }

  belongs_to :user
  has_one_attached :image
end