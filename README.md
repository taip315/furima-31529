# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_furigana     | string | null: false |
| last_furigana      | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| name                | string      | null: false | 
| explanation         | text        | null: false |
| category_id         | integer     | null: false |
| state_id            | integer     | null: false |
| delivery_fee_id     | integer     | null: false |
| prefecture_id       | integer     | null: false |
| day_id             | integer     | null: false |
| price               | integer     | null: false |
| user                | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column            | Type       | Options                  |
| ----------------- | ---------- | ------------------------ |
| user              | references | null: false, foreign_key |
| item              | references | null: false, foreign_key |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Type       | Options                  |
| ------------- | ---------- | -----------------------  |
| postal_number | string     | null: false              |
| prefecture_id | integer    | null: false              |
| municipality  | string     | null: false              |
| address       | string     | null: false              |
| building      | string     |                          |
| phone_number  | string     | null: false              |
| order      | references | null: false, foreign_key | 


### Association

- belongs_to :order