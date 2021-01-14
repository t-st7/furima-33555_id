# README

# テーブル設計

## users テーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false,null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| kana_last_name     | string | null: false  |
| kana_first_name    | string | null: false  |
| birth_year         | references | null: false, foreign_key: true  |
| birth_month        | references | null: false, foreign_key: true  |
| birth_day          | references | null: false, foreign_key: true  |

### Association
- has_many :items
- has_many :purchases


## items テーブル
|Column           |Type       |Options                           |
| --------------- | ---------- | ------------------------------- |
| product         | string     | null: false                     |
| description     | text       | null: false                     |
| category        | references | null: false, foreign_key: true  |
| delivery_charge | references | null: false, foreign_key: true  |
| state           | references | null: false, foreign_key: true  |
| condition       | references | null: false, foreign_key: true  |
| days            | references | null: false, foreign_key: true  |
| price           | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |


### Association
- belongs_to :users
- has_one    :purchases

## purchases テーブル
|Column      |Type        |Options                                 |
| ---------  |------------|--------------------------------------- |
| user       | references | null: false, foreign_key: true    |
| item       | references | null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses テーブル
|Column                |Type        |Options                         |
| -------------------- |----------- |------------------------------- |
| zip                  | integer    | null: false                   |
| state                | references | null: false, foreign_key: true |
| city                 | integer    | null: false                   |
| address_line         | string     | null: false                    |
| address_line_second  | string     |                                |
| phone_number         | string     | null: false                    |
| item                 | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
