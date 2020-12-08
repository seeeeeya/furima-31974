# テーブル 設計

## users テーブル

| Column                | Type    | Options    |
| --------------------- | ------- | ---------- |
| nickname              | string  | null:false |
| mail_address          | string  | null:false |
| password              | integer | null:false | 
| password_confirmation | integer | null:false | 
| family_name           | string  | null:false |
| last_name             | string  | null:false |
| family_name_kana      | string  | null:false |
| last_name_kana        | string  | null:false |
| birthday              | date    | null:false |

# Association
# has_many :items
# has_one :purchase

## items テーブル

| Column              | Type    | Options    |
| ------------------- | ------- | ---------- |
| product_name        | string  | null:false |
| description_of_item | string  | null:false |
| category            | text    | null:false |
| product_condition   | string  | null:false |
| shipping_charges    | string  | null:false |
| prefectures         | string  | null:false |
| days_to_ship        | string  | null:false |
| price               | integer | null:false |
| user_id             | integer | references|

# Association
# belongs_to :user
# has_one :purchase

## purchase テーブル

| Column          | Type    | Options    |
| --------------- | ------- | ---------- |
| card_number     | integer | null:false |
| expiration_date | integer | null:false |
| security_code   | integer | null:false |
| user_id         | integer | references |
| item_id         | integer | references |

# Association
# belongs_to :user
# belongs_to :items
# has_one :shipping_address

## shipping_address

| Column        | Type    | Options    |
| ------------- | ------- | ---------- |
| postal_code   | integer | null:false |
| prefectures   | string  | null:false |
| municipality  | string  | null:false |
| address       | string  | null:false |
| building_name | string  | null:true  |
| phone_number  | integer | null:false |

# Association
# belongs_to :purchase