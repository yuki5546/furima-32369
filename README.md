# README

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | textarea   | null: false |
| email                 | email  | null: false |
| password              | password | null: false |
| password-confirmation | password | null: false |
| last-name             | textarea   | null: false |
| first-name            | textarea   | null: false |
| last-name-kana        | textarea   | null: false |
| first-name-kana       | textarea   | null: false |
| user-birth-date(1i)   | references | null: false , foreign_key: true |
| user-birth-date(2i)   | references | null: false , foreign_key: true |
| user-birth-date(3i)   | references | null: false , foreign_key: true |

### Association
- has_many :items
- has_one  :transaction-items

## items テーブル

| Column              | Type       | Options     |
| ------              | ------     | ----------- |
| image               | Activestrageで実装    |
| name                | string     | null: false |
| info                | text       | null: false |
| category            | references | null: false , foreign_key: true |
| status              | references | null: false , foreign_key: true |
| shopping-fee-status | references | null: false , foreign_key: true |
| prefecture          | references | null: false , foreign_key: true |
| scheduled-delivery  | references | null: false , foreign_key: true |
| price               | text       | null: false |
| user                | references | null: false , foreign_key: true |

### Association
- belongs_to :user
- has_one :transaction-item
- has_one :category
- has_one :status
- has_one :shopping-fee-status
- has_one :prefecture 
- has_one :scheduled-delivery

# transaction-items テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| number       | text       | null: false |
| exp-month    | textarea   | null: false |
| exp-year     | textarea   | null: false , foreign_key: true |
| card-cvc     | text       | null: false |
| postal_code  | text       | null: false |
| prefecture   | references | null: false , foreign_key: true |
| city         | text       | null: false |
| addresses    | text       | null: false |
| building     | text       | null: false |
| phone-number | text       | null: false |

### Association
- belongs_to :item
- has_one :prefecture

# user-birth-date(1i)  テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| user-birth-date(1i)        | text       | null: false |

### Association
- belongs_to :item

# user-birth-date(2i)  テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| user-birth-date(2i)        | text       | null: false |

### Association
- belongs_to :item

# user-birth-date(3i)  テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| user-birth-date(3i)        | text       | null: false |

### Association
- belongs_to :item

# category テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| category     | text       | null: false |

### Association
- belongs_to :item

# status テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| status       | text       | null: false |

### Association
- belongs_to :item

# shopping-fee-status テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| shopping-fee-status        | text       | null: false |

### Association
- belongs_to :item

# prefecture テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| prefecture        | text       | null: false |

### Association
- belongs_to :item
- belongs_to :transfer-items

# scheduled-delivery テーブル
| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| scheduled-delivery       | text       | null: false |

### Association
- belongs_to :item