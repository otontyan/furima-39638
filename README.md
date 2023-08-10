# テーブル設計

## users テーブル

| Column              | Type      | Options                   |
| ------------------- | --------- | ------------------------- |
| nick_name           | string    | null: false               | #ニックネーム
| email               | string    | null: false, unique: true | #メールアドレス 
| encrypted_password  | string    | null: false               | #パスワード
| family_name_kanji   | string    | null: false               | #苗字（漢字）
| personal_name_kanji | string    | null: false               | #氏名（漢字）
| family_name_kana    | string    | null: false               | #苗字（カナ）
| personal_name_kana  | string    | null: false               | #氏名（カナ）
| birthdate           | date      | null: false               | #生年月日

has_many :items
has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    | #商品名
| item_description   | text       | null: false                    | #商品の説明
| category_id        | integer    | null: false                    | #カテゴリー（アクティブハッシュ）
| item_condition_id  | integer    | null: false                    | #商品の状態（アクティブハッシュ）
| shipping_cost_id   | integer    | null: false                    | #配送料の負担（アクティブハッシュ）
| shipping_origin_id | integer    | null: false                    | #発送元の地域（アクティブハッシュ）
| days_to_ship_id    | integer    | null: false                    | #発送までの日数（アクティブハッシュ）
| price              | integer    | null: false                    | #価格
| user               | references | null: false,foreign_key: true  |

belongs_to :user
has_one    :buy

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false,foreign_key: true  | #何を買ったか
| user      | references | null: false,foreign_key: true  | #どのユーザーが

belongs_to :user
belongs_to :item
has_one   :send

## sends テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    | #郵便番号
| shipping_origin_id | integer    | null: false                    | #都道府県（アクティブハッシュ）
| city               | string     | null: false                    | #市区町村
| street_address     | string     | null: false                    | #番地
| building_name      | string     |                                | #建物名（任意）
| phone_number       | string     | null: false                    | #電話番号
| buy                | references | null: false,foreign_key: true  | #どの購入記録

belongs_to :buy