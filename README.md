# README


記述すること	備考
アプリケーション名	
アプリケーション概要	このアプリケーションでできることを記述しましょう。
URL	デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
テスト用アカウント	ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
利用方法	このアプリケーションの利用方法を説明しましょう。
目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
データベース設計	ER図等を添付しましょう。
ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。


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
- has_many :orders


## items テーブル
|Column                     |Type       |Options                           |
| ------------------------- | ---------- | ------------------------------- |
| product                   | string     | null: false                     |
| description               | text       | null: false                     |
| category_id               | integer | null: false  |
| delivery_charge_id        | integer | null: false  |
| state_id                  | integer | null: false  |
| condition_id              | integer | null: false  |
| day_to_ship_id            | integer | null: false   |
| price                     | integer    | null: false                     |
| user                      | references | null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_one    :order

## orders テーブル
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
| order                | references | null: false, foreign_key: true |

### Association

- belongs_to :order
