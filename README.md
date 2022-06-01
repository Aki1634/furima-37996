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
（ここに追記していく）
|nickname|string |null: false|
|email   |string |null: false|
|password|string |null: false|
|date    |integer|null: false|
|name    |string |null: false|
|furigana|string |null: false|


### Association
（ここに追記していく）
- has_many :products
- has_many :logs

## products

|Column|Type|Options|
|------|----|-------|
|price      |string     |null: false|
|explanation|text       |null: false|
|category   |string     |null: false|
|situation  |string     |null: false|
|load       |string     |null: false|
|prefectures|string     |null: false|
|user       |references | null: false, foreign_key: true |


（ここに追記していく）


### Association
（ここに追記していく）
- belongs_to :user
- has_one :log


## shipping

|Column|Type|Options|
|------|----|-------|
（ここに追記していく）
|post       |string     |null: false|
|prefectures|string     |null: false|
|city       |string     |null: false|
|adress     |integer    |null: false|
|building   |string     |
|number     |integer    |null: false|
|log        |references | null: false, foreign_key: true |


### Association
（ここに追記していく）
- belongs_to :log

## log

|Column|Type|Options|
|------|----|-------|
（ここに追記していく）
|price   |string     | null: false|
|user    |references | null: false, foreign_key: true |
|products|references | null: false, foreign_key: true |

### Association
（ここに追記していく）
- belongs_to :user
- belongs_to :products
- has_one :shipping