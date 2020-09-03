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



## usersテーブル

| Colum                | Type       | Options      |
| -------------------- | ---------- | ------------ |
| nickname             | string     | null: false  |
| email                | string     | null: false  |
| password             | string     | null: false  |
| family_name          | string     | null: false  |
| first_name           | string     | null: false  |
| family_name_kana     | string     | null: false  |
| first_name_kana      | string     | null: false  |
| birth_year_id        | integer    | null: false  |
| birth_month_id       | integer    | null: false  |
| birth_day_id         | integer    | null: false  |

### Association
- has_many   :products
- has_one    :order
- has_many   :user_comments
- has_many   :comments, through: user_comments



## productsテーブル

| Colum                | Type       | Options      |
| -------------------- | ---------- | ------------ |
| image                | string     | null: false  |
| seller               | string     | null: false  |
| price                | integer    | null: false  |
| category_id          | integer    | null: false  |
| status_id            | integer    | null: false  |
| shipping_charges_id  | integer    | null: false  |
| shipping_ region_id  | integer    | null: false  |
| date_shipment_id     | integer    | null: false  |

### Association
- belongs_to   :users
- has_many     :favorites
- has_many     :comments



## odersテーブル

| Colum                | Type       | Options      |
| -------------------- | ---------- | ------------ |
| user_id              | references | null: false  |
| product_id           | references | null: false  |
| price                | string     | null: false  |

### Association
- belongs_to   :users
- belongs_to   :products
- has_one      :addresses



## addressesテーブル

| Colum                | Type       | Options      |
| -------------------- | ---------- | ------------ |
| oder_id              | references | null: false  |
| postal_code          | string     | null: false  |
| prefecture           | string     | null: false  |
| city                 | string     | null: false  |
| number               | string     | null: false  |
| building             | string     | null: false  |
| phone                | integer    | null: false  |

### Association
- belongs_to  :oders



## commentsテーブル

| Colum                | Type       | Options      |
| -------------------- | ---------- | ------------ |
| user_id              | references | null: false  |
| product_id           | references | null: false  |
| comment              | string     | null: false  |

### Association
- belongs_to  :products
- has_many    :user_comments
- has_many :users, through: user_comments



## user_commentsテーブル

| Colum                | Type       | Options      |
| -------------------- | ---------- | ------------ |
| user_id              | references | null: false  |
| comment_id           | references | null: false  |

### Association
- belongs_to  :users
- belongs_to  :products



## favoritesテーブル
| Colum                | Type       | Options      |
| -------------------- | ---------- | ------------ |
| good                 | ●●         | null: false  |
| product_id           | references | null: false  |

### Association
- belongs_to  :products