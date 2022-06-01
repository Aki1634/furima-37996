# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## usres

|Column|Type|Options|
|------|----|-------|
|nickname          |string |null: false|
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false|
|birth_day         |date   |null: false|
|first_name        |string |null: false|
|last_name         |string |null: false|
|first_furigana    |string |null: false|
|last_furigana     |string |null: false|

### Association

- has_many :products
- has_many :logs

## products

|Column|Type|Options|
|------|----|-------|
|title         |string     |null: false|
|price         |integer    |null: false|
|explanation   |text       |null: false|
|category_id   |integer    |null: false|
|situation_id  |integer    |null: false|
|charge_id     |integer    |null: false|
|prefectures_id|integer    |null: false|
|ship_day_id   |integer    |null: false|
|user          |references | null: false, foreign_key: true |





### Association

- belongs_to :user
- has_one :log


## shipping's
|Column|Type|Options|
|------|----|-------|
|post          |string     |null: false|
|prefectures_id|integer    |null: false|
|city          |string     |null: false|
|adress        |string     |null: false|
|building      |string     |           |
|number        |string     |null: false|
|log           |references | null: false, foreign_key: true |


### Association

- belongs_to :log

## logs

|user    |references | null: false, foreign_key: true |
|product |references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping