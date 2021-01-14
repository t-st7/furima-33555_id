# README

# テーブル設計

## users テーブル
| Column     | Type   | Options      |
| ---------- | ------ | ------------ |
| nickname   | string | null: false  |
| email      | string | unique: true |
| password   | string | null: false  |
| name       | string | null: false  |
| furigana   | string | null: false  |

### Association
- has_many :items
- has_many :purchases
- has_one  :addresses


## items テーブル
|Column           |Type       |Options                           |
| --------------- | ---------- | ------------------------------- |
| product         | string     | null: false                     |
| description     | text       | null: false                     |
| category        | references | null: false, foreign_key: true  |
| delivery_charge | references | null: false, foreign_key: true  |
| region          | references | null: false, foreign_key: true  |
| condition       | references | null: false, foreign_key: true  |
| days            | references | null: false, foreign_key: true  |
| price           | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |


### Association
- belongs_to :users
- has_one    :purchases

## purchases テーブル
|Column      |Type   |Options                                 |
| ---------  |-------|--------------------------------------- |
| user       | references | null: false, foreign_key: true    |
| items      | references | null: false, foreign_key: true    |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル
|Column      |Type        |Options                         |
| ---------  |----------- |------------------------------- |
| address    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :purchases
