class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :name
    validates :description_of_item
    validates :category_id, numericality:{ other_than: 1 }
    validates :product_condition_id, numericality:{ pther_than: 1 }
    validates :shipping_charges_id, numericality:{ pther_than: 1 }
    validates :prefectures_id, numericality:{ pther_than: 1 }
    validates :days_to_ship_id, numericality:{ pther_than: 1 }
    validates :price, numericality:{ greater_than: 300, less_than: 9_999_999 }
  end

  validates :price, format: { with: /\A[0-9]+\z/,message: "半角数字のみ使えます" }


  belongs_to :user
  has_one :purchase
  has_many :articles
end