# Lunger 
<br>
  <img src="https://i.gyazo.com/fc1f7bd7fb7a5cd270c5a19c333497a3.jpg" width="600x600"><br>
  
# 概要
エンジニアがわからないところはエンジニアに聞くということで
エンジニアが投稿した問題に対して他のエンジニアが答える
インプットとアウトプットにもなるアプリ

# 本番環境
http://18.180.66.99/

# テストユーザー
email: test@test.test
password: test1234

# 制作背景
qiitaのようなものを使いやすく自分でアレンジしました。

# 工夫したポイント
言語ごとに投稿をわけてわかりやすくしました。
投稿者とコメントのやりとりができます。

# 使用技術(開発環境)
- Ruby 2.5.1
- Rails 5.2.3
- MySQL 5.6.43
- Haml 5.1.2
- Sass 3.7.4
- jQuery 4.3.5
- AWS
  - EC2
  - S3
- Github

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
### Association
has_many :posts
has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|language_id|integer|null: false|
|user_id|integer|null: false|
### Association
has_many :images
has_many :comments
belongs_to :user
belongs_to :language

## languagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
has_many :posts

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|integer|null: false|
|post_id|integer|null: false|
### Association
belongs_to :user
belongs_to :post

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|post_id|references||foreign_key: true|
### Association
belongs_to :post
