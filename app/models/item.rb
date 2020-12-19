class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :name
    validates :user_id
    validates :description_of_item
    validates :category_id, numericality:{ other_than: 1 }
    validates :product_condition_id, numericality:{ other_than: 1 }
    validates :shipping_charges_id, numericality:{ other_than: 1 }
    validates :prefectures_id, numericality:{ other_than: 1 }
    validates :days_to_ship_id, numericality:{ other_than: 1 }
    validates :price, numericality:{ greater_than: 299, less_than: 10_000_000 }
  end

  validates :price, format: { with: /\A[0-9]+\z/,message: "半角数字のみ使えます" }


  belongs_to :user
  has_one_attached :image
end