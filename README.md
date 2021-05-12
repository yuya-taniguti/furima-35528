# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
|--------------------|------------|---------------------------|
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| first_name         | string     | null: false               |
| last_name          | string     | null: false               |
| first_name_k       | string     | null: false               |
| last_name_k        | string     | null: false               |
| birthday-year      | date       | null: false               |

### Association

- has_many :items
- has_many :histories

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
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :history

## histories テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| regional_id   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | string     | null: false                    |
| building_name | string     |                                |
| history       | references | null: false, foreign_key: true |

### Association

- belongs_to :history