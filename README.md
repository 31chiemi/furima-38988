# README
# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| nickname           | string   | null: false , unique: true |
| email              | string   | null: false                |
| encrypted_password | string   | null: false                |
| last_name          | text     | null: false                |
| first_name         | text     | null: false                |
| last_name_kana     | text     | null: false                |
| first_name_kana    | text     | null: false                |
| birthday           | datetime | null: false                |

### Association

- has_many :items
- has_many :purchases

## Items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| content         | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| price           | integer    | null: false                    |
| shipment_charge | integer    | null: false                    |
| shipment_region | string     | null: false                    |
| shipment_term   | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| Item     | references | null: false, foreign_key: true |
| shipment | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :shipment

## shipment テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| postcode     | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association#

- belongs_to :purchase

