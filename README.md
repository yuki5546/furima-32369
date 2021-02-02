# README

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | string   | null: false |
| email                 | email    | null: false , unique: true |
| last-name             | string   | null: false |
| first-name            | string   | null: false |
| last-name-kana        | string   | null: false |
| first-name-kana       | string   | null: false |
| user-birth-date       | date     | null: false |

### Association
- has_many :items
- has_many :transaction-items

## items テーブル
<!-- imageカラムはActivestrageで実装する -->
<!-- プルダウンで選択する箇所はactive_hashを使い実装する -->

| Column                 | Type       | Options     |
| ------                 | ------     | ----------- |
| name                   | string     | null: false |
| info                   | string       | null: false |
| category_id            | int        | null: false |
| status_id              | int        | null: false |
| shopping-fee-status_id | int        | null: false |
| prefecture_id          | int        | null: false |
| scheduled-delivery_id  | int        | null: false |
| price                  | int        | null: false |
| user                   | references | null: false |

### Association
- belongs_to :user
- has_one :transaction-item
- has_one :shopping-address

# transaction-items テーブル

| Column       | Type   | Options     |
| ------       | ------ | ----------- |
| number       | int    | null: false |
| exp-month    | int    | null: false |
| exp-year     | int    | null: false |
| card-cvc     | int    | null: false |

### Association
- belongs_to :item

# shopping-address テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| postal_code  | int        | null: false |
| prefecture_id| int        | null: false , foreign_key: true |
| city         | string     | null: false |
| addresses    | string     | null: false |
| building     | string     | null: false |
| phone-number | int        | null: false |

### Association
- belongs_to :item

