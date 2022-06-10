# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| name_sei           | string | null: false               | 
| name_mei           | string | null: false               |
| birth_date         | string | null: false               |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product             | string     | null: false                    |
| explanation         | text       | null: false                    |
| condition           | text       | null: false                    |
| category            | text       | null: false                    |
| delivery_charge     | text       | null: false                    |
| delivery_prefecture | text       | null: false                    |
| delivery_day        | text       | null: false                    |
| price               | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

  * imageはActiveStorageで実装するため含まない

### Association

- belongs_to :user
- has_one    :buyer

## buyers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :information

## informations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| street_name   | string     | null: false                    |
| house_number  | string     | null: false                    |
| Prefectures   | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| buyerID       | references | null: false, foreign_key: true |

### Association

- belongs_to :byter

