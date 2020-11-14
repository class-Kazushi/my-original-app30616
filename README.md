# README

## usersテーブル

| Column          | Type    | Option                    |
|-----------------|---------|---------------------------|
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| family_name     | string  | null: false               |
| first_name      | string  | null: false               |
| family_kana     | string  | null: false               |
| first_kana      | string  | null: false               |
| gender_id       | integer | null: false               |
| age             | integer | null: false               |
| occupation_id   | integer | null: false               |
| ability         | text    | null: false               |
| introduction    | text    | null: false               |

### Association

has_many :requests
has_many :applies
has_one :support


## requestsテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| title           | string     | null: false       |
| user            | references | foreign_key: true |
| category_id     | integer    | null: false       |
| content         | text       | null: false       |
| url             | string     |                   |
| job             | text       | null: false       |
| want            | text       | null: false       |
| period          | date       | null: false       |
| reword          | text       | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| people          | integer    | null: false       |
| donation        | integer    | null: false       |

### Association

belongs_to :user
has_many :applies
has_many :supports


## supportsテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| price           | integer    | null: false       |
| user            | references | foreign_key: true |
| request         | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :request


## appliesテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| phone_num       | string     |                   |
| reason          | text       | null: false       |
| question        | text       |                   |
| request         | references | foreign_key: true |
| user            | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :request