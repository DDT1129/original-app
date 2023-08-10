# テーブル設計

## usersテーブル

|Column              |Type            |Options                     |
| ------------------ | -------------- | -------------------------- |
|nickname            |string          |null: false                 |
|code                |string          |null: false                 |
|email               |string          |null: false, unique: true   |
|encrypted_password  |string          |null: false                 |

### Association

- has_many :situations, dependent :destroy
- has_many :memos, dependent :destroy
- belongs_to :family_account, optional: true

## family_accountsテーブル

|Column         |Type        |Options                        |
| ------------- | ---------- | ----------------------------- |
|family_code    |string      |null: false, unique: false     |
|user_id        |references  |null: false, foreign_key: true |

### Association

- has_many :users

## situationsテーブル

|Column             |Type        |Options                          |
| ----------------- | ---------- | ------------------------------- |
|genre_id           |integer     |null: false                      |
|purpose            |string      |                                 |
|family_code        |string      |null: false                      |
|user_id            |references  |null: false, foreign_key: true   |

### Association

- belongs_to :genre
- belongs_to :user

## memosテーブル

|Column          |Type        |Options                         |
| -------------- | ---------- | ------------------------------ |
|text            |string      |null: false                     |
|family_code     |string      |null: false                     |
|completed       |boolean     |default: false                  |
|user_id         |references  |null: false, foreign_key: true  |

### Association

- belongs_to :user