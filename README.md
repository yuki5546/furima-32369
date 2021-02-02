# README

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | string   | null: false |
| email                 | email    | null: false , unique: true |
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
| info                   | string     | null: false |
| category_id            | int        | null: false |
| status_id              | int        | null: false |
| shopping_fee-status_id | int        | null: false |
| prefecture_id          | int        | null: false |
| scheduled_delivery_id  | int        | null: false |
| price                  | int        | null: false |
| user                   | references | null: false |

### Association
- belongs_to :user
- has_one :transaction_item
- has_one :shopping_address

# transaction_items テーブル

| Column       | Type   | Options     |
| ------       | ------ | ----------- |
| user         | references| null: false , foreign_key: true |
| item         | references| null: false , foreign_key: true |

### Association
- belongs_to :item

# shopping_address テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| postal_code  | string     | null: false |
| prefecture   | int        | int         |
| city         | string     | null: false |
| address      | string     | null: false |
| building     | string     |
| phone_number | string     | null: false |

### Association
- belongs_to :item

