# README

## Usersテーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birthday        | date    | null: false               |

### Association
- has_many :items
- has_many :orders

<!-- - has_many :comments -->

## Items テーブル


| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| describe           | text       | null: false                    |
| category_id        | integer       | null: false                    | 
| condition_id       | integer       | null: false                    | 
| postage_id         | integer    | null: false                    | 
| ship_from_id       | integer       | null: false                    |
| delivery_day_id    | integer       | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user


## Orders

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


### Association

- belongs_to :items
- belongs_to :user
- has_one :destination


## Destination

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | string     | null: false                    |
| prefecture_id   | integer    | null: false                    | 
| city            | string     | null: false                    |
| address         | string     | null: false
| building        | string     |                                |
| phone_num       | string     | null: false                    |
| order           | references | null: false, foreign_key: true |


### Association

- belongs_to :order


