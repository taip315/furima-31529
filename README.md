# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_furigana     | string | null: false |
| last_furigana      | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| name         | string      | null: false |
| explanation  | text        | null: false |
| category     | string      | null: false |
| state        | string      | null: false |
| delivery_fee | string      | null: false |
| region       | string      | null: false |
| days         | string      | null: false |
| price        | integer     | null: false |
| user         | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column            | Type       | Options                  |
| ----------------- | ---------- | ------------------------ |
| card_number       | string     | null: false              |
| expiration_date   | string     | null: false              |
| security_code     | integer    | null: false              |
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
| prefecture    | string     | null: false              |
| municipality  | string     | null: false              |
| address       | string     | null: false              |
| building      | string     |                          |
| phone_number  | integer    | null: false              |
| purchase      | references | null: false, foreign_key | 


### Association

- belongs_to :purchase