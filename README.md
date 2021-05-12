# テーブル設計

## users テーブル

| Column        |Type    | Options     |
|---------------|--------|-------------|
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| first_name    | string | null: false |
| last_name     | string | null: false |
| first_name_k  | string | null: false |
| last_name_k   | string | null: false |
| birthday-year | date   | null: false |

### Association

- has_many :items
- has_many :history's

## items テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| image         | text       | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| postage       | string     | null: false                    |
| regional      | references | null: false, foreign_key: true |
| shipping_data | string     | null: false                    |
| price         | string     | null: false                    |
| seller_id     | references | null: false, foreign_key: true |
| buyer_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :history
- has_one :address

## history's テーブル

| Column | Type   | Options                        |
|--------|--------|--------------------------------|
| user   | string | null: false, foreign_key: true |
| item   | string | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :items
- belongs_to :addresses

## addresses テーブル

| Column       | Type   | Options     |
|--------------|--------|-------------|
| postal_code  | string | null: false |
| prefectures  | string | null: false |
| municipality | string | null: false |
| address      | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :history
- belongs_to :item