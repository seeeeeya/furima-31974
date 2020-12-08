# テーブル 設計

## users テーブル

| Column         | Type   | Options    |
| -------------- | ------ | ---------- |
| name           | string | null:false |
| name_width     | string | null:false |
| birthday       | string | null:false |
| email          | string | null:false |
| password       | string | null:false | 

# Association
# has_many :items
# has_one :purchase

## items テーブル

| Column         | Type   | Options    |
| -------------- | ------ | ---------- |
| product_name   | string | null:false |
| status         | string | null:false |
| category       | text   | null:false |
| category_save  | text   | null:false |
| price          | string | null:false |
| seller         | string | null:false |

# Association
# belongs_to :user
# has_one :purchase

## purchase テーブル

| Column              | Type   | Options    |
| ------------------- | ------ | ---------- | 
| purchase            | string | null:false |
| user                | string | null:false |
| product_information | string | null:false |

# Association
# belongs_to :user
# belongs_to :items
# has_one :shipping_address

## shipping_address

| Column           | Type   | Options    |
| ---------------- | ------ | ---------- |
| shipping_address | string | null:false |
| prefectures      | text   | null:false |
| building_name    | string | null:false |

# Association
# belongs_to :purchase