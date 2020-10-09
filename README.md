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
- has_many :credit_cards

<!-- - has_many :comments -->

## Items テーブル


| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| describe        | text       | null: false                    |
| category        | enum       | null: false                    | 
| condition       | enum       | null: false                    | 
| postage         | boolean    | null: false                    | 
| ship_from       | string     | null: false                    |
| delivery_day    | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- has_one :credit_card
- has_ one :destination
- belongs_to :user


## Credit_card

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| items_id        | references | null: false, foreign_key: true |
<!-- | card_num        | integer    | null: false                    |
| expire_date     | integer    | null: false                    |
| security_code   | integer    | null: false                    | -->
### Association

- belongs_to :items
- belongs_to :user
- has_one :destination


## Destination

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | integer    | null: false                    |
| prefecture      | enum       | null: false                    | 
| city            | string     | null: false                    |
| building        | string     |                                |
| phone_num       | integer    | null: false                    |
| credit_card_id  | references | null: false, foreign_key: true |
| items_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :credit_card
- belongs_to :items

