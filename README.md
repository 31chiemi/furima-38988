# README
# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| nickname           | string   | null: false , unique: true |
| email              | string   | null: false                |
| encrypted_password | string   | null: false                |
| last_name          | string   | null: false                |
| first_name         | string   | null: false                |
| last_name_kana     | string   | null: false                |
| first_name_kana    | string   | null: false                |
| birthday           | date     | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| content      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| price        | integer    | null: false                    |
| charge_id    | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| term_id      | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| shipment | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :shipment

## shipments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | text       | null: false                    |
| building      | string     |                                |
| phonenumber   | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association#

- belongs_to :order

