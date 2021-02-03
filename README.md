# README

## users テーブル

| Column                | Type     | Options     |
| --------              | ------   | ----------- |
| nickname              | string   | null: false |
| email                 | string   | null: false , unique: true |
| encrypted_password    | string   | null: false |
| last_name             | string   | null: false |
| first_name            | string   | null: false |
| last_name_kana        | string   | null: false |
| first_name_kana       | string   | null: false |
| user_birth_date       | date     | null: false |

### Association
- has_many :items
- has_many :transaction_items

## items テーブル
<!-- imageカラムはActivestrageで実装する -->
<!-- プルダウンで選択する箇所はactive_hashを使い実装する -->

| Column                 | Type       | Options     |
| ------                 | ------     | ----------- |
| name                   | string     | null: false |
| info                   | text       | null: false |
| category_id            | integer    | null: false |
| status_id              | integer    | null: false |
| shopping_fee_status_id | integer    | null: false |
| prefecture_id          | integer    | null: false |
| scheduled_delivery_id  | integer    | null: false |
| price                  | integer    | null: false |
| user                   | references | null: false , foreign_key: true |

### Association
- belongs_to :user
- has_one :transaction_item


# transaction_items テーブル

| Column           | Type   | Options     |
| ------           | ------ | ----------- |
| user             | references | null: false , foreign_key: true |
| item             | references | null: false , foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :shopping_address


# shopping_address テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building         | string     |
| phone_number     | string     | null: false |
| transaction_item | references | null: false |

### Association
- belongs_to :transaction_item

