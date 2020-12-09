# テーブル 設計

## users テーブル

| Column                | Type   | Options    |
| --------------------- | ------ | ---------- |
| nickname              | string | null:false |
| email                 | string | null:false |
| encrypted_password    | string | null:false |  
| family_name           | string | null:false |
| last_name             | string | null:false |
| family_name_kana      | string | null:false |
| last_name_kana        | string | null:false |
| birthday              | date   | null:false |

# Association
# has_many :items
# has_many :purchase

## items テーブル

| Column               | Type    | Options          |
| -------------------- | ------- | ---------------- |
| name                 | string  | null:false       |
| description_of_item  | text    | null:false       |
| category_id          | integer | null:false       |
| product_condition_id | integer | null:false       |
| shipping_charges_id  | integer | null:false       |
| prefectures_id       | integer | null:false       |
| days_to_ship_id      | integer | null:false       |
| price                | integer | null:false       |
| user_id              | integer | foreign_key:true null:false |

# Association
# belongs_to :user
# has_one :purchases

## purchases テーブル

| Column          | Type    | Options                     |
| --------------- | ------- | --------------------------- |
| user_id         | integer | foreign_key:true null:false |
| item_id         | integer | foreign_key:true null:false |

# Association
# belongs_to :user
# belongs_to :item
# has_one :shipping_address

## shipping_address

| Column         | Type    | Options          |
| -------------- | ------- | ---------------- |
| postal_code    | string  | null:false       |
| prefecture_id  | integer | null:false       |
| municipality   | string  | null:false       |
| address        | string  | null:false       |
| building_name  | string  |                  |
| phone_number   | string  | null:false       |


# Association
# belongs_to :purchase