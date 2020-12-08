# テーブル 設計

## users テーブル

| Column         | Type   | Options  |
| -------------- | ------ | -------- |
| name           | string | NOT NULL |
| email          | string | NOT NULL |
| password       | string | NOT NULL |   

# Association
# has_many :items
# has_one :purchase

## items テーブル

| Column         | Type   | Options  |
| -------------- | ------ | -------- |
| product_name   | string | NOT NULL |
| category       | text   | NOT NULL |
| price          | string | NOT NULL |
| seller         | string | NOT NULL |

# Association
# belongs_to :user
# has_one :purchase

## purchase テーブル

| Column   | Type   | Options  |
| -------- | ------ | -------- | 
| purchase | string | NOT NULL |

# Association
# belongs_to :user
# belongs_to :items
# has_one :shipping_address

## shipping_address

| Column           | Type   | Options  |
| ---------------- | ------ | -------- |
| shipping_address | string | NOT NULL |

# Association
# belongs_to :purchase