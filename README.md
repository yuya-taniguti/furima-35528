# テーブル設計

## users テーブル

| Column             | Type       | Options                            |
|--------------------|------------|------------------------------------|
| nickname           | references | null: false, foreign_key: true     |
| email              | string     | null: false, unique: true          |
| encryped_password  | string     | null: false                        |
| first_name         | string     | null: false                        |
| last_name          | string     | null: false                        |
| first_name_k       | string     | null: false                        |
| last_name_k        | string     | null: false                        |
| birthday-year      | date       | null: false                        |

### Association

- has_many :items
- has_many :history's

## items テーブル

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| state_id          | integer    | null: false                    |
| postage_id        | integer    | null: false                    |
| regional_id       | integer    | null: false                    |
| shipping_data_id  | integer    | null: false                    |
| price             | string     | null: false                    |
| buyer_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :history
- has_one :address

## history's テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

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