# テーブル 設計

## users テーブル

| Column                | Type    | Options    |
| --------------------- | ------- | ---------- |
| nickname              | string  | null:false |
| email                 | string  | null:false |
| encrypted_password    | integer | null:false |  
| family_name           | string  | null:false |
| last_name             | string  | null:false |
| family_name_kana      | string  | null:false |
| last_name_kana        | string  | null:false |
| birthday              | date    | null:false |

# Association
# has_many :items
# has_one :purchases

## items テーブル

| Column               | Type    | Options          |
| -------------------- | ------- | ---------------- |
| name                 | string  | null:false       |
| description_of_item  | string  | null:false       |
| category_id          | string  | null:false       |
| product_condition_id | string  | null:false       |
| shipping_charges_id  | string  | null:false       |
| prefectures_id       | string  | null:false       |
| days_to_ship_id      | string  | null:false       |
| price                | integer | null:false       |
| user_id              | integer | foreign_key:true |

# Association
# belongs_to :user
# has_one :purchases

## purchases テーブル

| Column          | Type    | Options          |
| --------------- | ------- | ---------------- |
| user_id         | integer | foreign_key:true |
| item_id         | integer | foreign_key:true |

# Association
# belongs_to :users
# belongs_to :items
# has_one :shipping_address

## shipping_address

| Column         | Type    | Options          |
| -------------- | ------- | ---------------- |
| postal_code    | string  | null:false       |
| prefectures_id | string  | null:false       |
| municipality   | string  | null:false       |
| address        | string  | null:false       |
| building_name  | string  | null:true        |
| phone_number   | string  | null:false       |


# Association
# belongs_to :purchases