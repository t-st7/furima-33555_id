# README

# テーブル設計

## users テーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| kana_last_name     | string | null: false  |
| kana_first_name    | string | null: false  |
| birthday           | date   | null: false  |

### Association
- has_many :items
- has_many :purchases


## items テーブル
|Column              |Type       |Options                           |
| ------------------ | ---------- | ------------------------------- |
| product            | string     | null: false                     |
| description        | text       | null: false                     |
| category_id        | integer | null: false  |
| delivery_charge_id | integer | null: false  |
| state_id           | integer | null: false  |
| condition_id       | integer | null: false  |
| days_id            | integer | null: false   |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_one    :purchase

## purchases テーブル
|Column      |Type        |Options                                 |
| ---------  |------------|--------------------------------------- |
| user       | references | null: false, foreign_key: true    |
| item       | references | null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
|Column                |Type        |Options                         |
| -------------------- |----------- |------------------------------- |
| zip                  | string     | null: false                   |
| state_id             | integer    | null: false                    |
| city                 | string     | null: false                   |
| address_line         | string     | null: false                    |
| address_line_second  | string     |                                |
| phone_number         | string     | null: false                    |
| purchase             | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

### コピペ用

- nickname:, email:, password: "000000", password_confirmation: "000000", last_name:, first_name:, kana_last_name:, kana_first_name:, birthday: