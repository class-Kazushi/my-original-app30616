# README

# アプリケーション名
Our-Board

## アプリケーション概要

　このアプリケーションは、人や地域・組織が抱えている課題を発信し、その解決に向けての支援を募ることやその発信に対して、さまざまなかたちでの支援実現に向けたプラットフォームです。
　小さな個人的な問題から地域や組織が抱えている大きな問題まで幅広く気軽に依頼を掲載することで人的支援や資金援助を募ることができるアプリケーションとなっています。


## URL
https://our-board30616.herokuapp.com/


## テスト用アカウント等
■ 依頼者用
・メールアドレス：checkers2020@gmail.com
・パスワード：request2020

■ 支援者用
・メールアドレス：aceburn2020@gmail.com
・パスワード：support2020

■ ID/Pass
・ID: open
・Pass: 6666

■ 購入用カード情報
番号：4242424242424242
期限：登録時より未来
セキュリティコード：123 (任意の数字3文字)


## 利用方法

　新規登録の項目をクリックするとユーザー新規登録ができ、ログインすることで依頼を投稿することや、その依頼に対して支援がしたいという場合は援助をすることができます。
応募するだけでなく資金援助という形で依頼に応えることもでき、クレジットカード決済によって資金援助を行うことができます。
　依頼への応募と資金援助は依頼者が投稿した依頼の詳細ページに遷移すると、応募する・資金援助するというボタンがあるのでそのボタンをクリックし、各種必要事項を入力することで実行できます。

## 目指した課題解決

　今回私がこのようなアプリケーションを開発しようと考えたのは、アプリケーションを通じて人々の抱える悩みや社会の問題解決に貢献していきたいと考えていたからです。人々が抱えている悩みや問題・課題というものは発信して誰かに伝わらないとまわりへの関心を得ることはできませんが、そのやり方がわからない方が多かったり、発信する環境を見つかられなかったりする方が多い印象があります。
　どのような問題であろうと、どういった人が抱えている問題だろうと、気軽にそれを発信して解決に導いてくれる存在へとつなげることで多くの人や社会の力になれればという願いのもと作成したアプリケーションです。
　下記のような個人や組織、または地域といったさまざまな環境において抱えている課題や声を発信していくことで、人々への関心や支援の実現を目指します。
・個人的に悩みがあるけど、相談できる人がいない
・ボランティア活動を行いたいが人手が足りない
・地域のイベントの参加者が一向に増えない
　また、このアプリケーションでは課題の発信のみならず、支援をする側への視点にも目を向けており、
・社会貢献に興味があるが何から始めたらいいかわからない
・自分の能力を生かせる環境が見つからない
・普段の生活とは違った分野の活動を行ってみたい
という考えを持った方への機会や経験の提供を目指します。


## 工夫したポイント

　工夫した点は、アプリケーションのデザインには一番力をいれて作成してきたことです。
　アプリケーション全体的にビューにおいて学校の黒板や廊下に設置されている掲示板を意識してデザインを考えました。これは依頼や資金援助というワードにおいて堅いイメージを捉える方も少なからずいらっしゃると考えたためです。
　社会や個人の問題解決につなげるといっても、黒板にメモ用紙をマグネットでとめるような、または掲示板に画鋲を使ってポスターを貼り付けるというそんな気軽な感じでこのアプリケーションを用いて発信するために利用していただきたいと考え、このようにデザインしました。


## DEMO
・投稿された依頼案件に応募する
https://i.gyazo.com/b121aefffd67ffeecf7bb4b5229d3f0e.gif

・依頼への資金援助
https://i.gyazo.com/51a331793797ebbc7c82a4ec510a08da.gif

・依頼投稿イメージ
https://i.gyazo.com/fea04841e7064e0cf67e4820031fe0c5.gif



## 実装予定の機能
・依頼検索機能
 カテゴリーや都道府県ごとで検索、または検索したワードにマッチする依頼投稿のみ表示する機能
・依頼拡散機能
 投稿された依頼をさらにSNSでフォロワーに向けて投稿できる機能
・SNS認証機能
 SNSアカウントでユーザー新規登録する機能

## データベース設計

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