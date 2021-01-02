# Bucket List
人生でやってみたいこと・挑戦したいことを投稿するSNSアプリです。

URL：http://54.238.155.175/

こちらのアカウントを使ってください
Email: ruby@icloud.como<br>
Password: rubyonrails

![bucket-list-3675656_1280](https://user-images.githubusercontent.com/68426424/103326168-6c71a580-4a92-11eb-9017-c2953ea29738.png)

## アプリ概要
こちらのアプリのコンセプトは、以下の３つです。

・自分が挑戦したいことをリスト化することで、人生の中で本当にしたいことの明確する<br>
・投稿・コメント機能通じて、他のユーザーとの交流、そしてインスパレーションを受ける<br>
・今度は自分がインスピレーターとしての価値をユーザーに届ける<br>

*基本的にはtwitterのような投稿、コメント、いいね、フォロー機能のあるSNSですが、 その他に以下のような特徴のあるアプリです。

・アプリから、Bucket Listを作成、編集、削除できる<br>
・設定したBucket Listを達成できた場合は、編集ページの達成フラグから達成Bucket Listの新規投稿画面に遷移される<br>

## 開発した背景

　Bucket Listという言葉を初めて知ったのは、友達のアメリカ人と話していたときです。<br>
Do you have something that you'd like to in the line like skydiving?
と、この先何か挑戦してみたいことがあるかを尋ねたときに、You mean Bucket List?? とそのとき初めてBucket Listという言葉の存在を知りました。

それがBucket Listというアプリケーションを作ろうと思ったきっかけです。

しかし、いざBucket Listを作ろうとノートとペンを用意したのですが、なかなか思い浮かばない。

そもそも、

・紙に書いても、忘れて、最終的になくす<br>
・共有できるプラットホームが必要<br>
・やってみたいと思うきっかけが必須<br>
・Bucket Listを達成するために何から始めればいいか分からない<br>

　などなど、様々な課題に気づきました。

そんなとき、Bucket Listをアプリケーションにすれば、

✔️ Bucket Listをリスト化でき、忘れない<br>
✔️ 他のユーザーとBucket Listをシェアできる<br>
✔️ インスパレーションンをギブ＆テイクできる<br>
✔️ 達成するまでのロードマップの手助けとなる<br>

　と考え、このアプリの開発に取り組みました。
 
また、コロナウイルスの影響もこのアプリを作るきっかけに関係しています。<br>
　今、世界中の人々がコロナウイルスで挑戦したいことができなかったり、したくてもできない環境化にいます。しかしながら、この期間をポジティブに考え、本当にしたいことは何かを考え、準備するいい機会だと私は思いました。人類がコロナウイルスが打ち勝ったときに、すぐに動きだせるようにこのアプリが少しでも手助けできればと思い、実装を開始しました。<br>

## 使用画面のイメージ

<img width="1440" alt="Screen Shot 2020-12-29 at 16 37 55" src="https://user-images.githubusercontent.com/68426424/103325618-d9d00700-4a8f-11eb-896a-46259e7c6c2e.png">

## 使用技術

### ○フロントエンド
HTML / SCC / Sass / Bootstrap /
jquery-rails　4.4.0<br>

### ○バックエンド

Ruby 2.6.5<br>
rails 6.0.3<br>

### ○インフラ
sqlite3 1.4.2<br>
AWS ( EC2, S3, Route53, VPC, IAM )

### ○その他使用ツール
Visual Studio Code<br>


## 機能一覧

#### ○ユーザー登録関連
　・新規登録、プロフィール編集機能<br>
　・ログイン、ログアウト機能<br>

#### ○Bucket Listの投稿機能(CRUD)
　・Bucket Listの新規作成、一覧表示、編集、削除機能

#### ○達成したBucket Listの投稿機能(CRUD)
　・達成したBucket Listの作成、一覧表示、編集機能

　Bucket Listを新規作成し、それを達成することができた場合、編集ページの達成フラグから達成を選択すると、達成したBucket Listのページに遷移します。<br>
そして、感想やアドバイスなどのカラムを記入すると、達成済みBucket Listに移行されます。

　ホームページの左上のBucket Listを押すと全ユーザーが投稿したBucket Listをみることができ、Bucket Listのタグを押すと、フォローしているユーザーのBucket List、達成できたBucket Listのタグを押すと、フォローしているユーザーの達成したBucket Listを閲覧することができます。

#### ○コメント機能(CRUD)
　・達成したBucket Listにコメント作成、一覧表示、編集、削除機能

#### ○いいね機能 (jquery)
　・新規作成したBucket Listにいいねする

#### ○フォロー機能(ajax)
　・ユーザーのプロフィールからフォロー、アンフォローできる

#### ○グット機能(ajax)
　・達成したBucket Listにグットボタン

#### ○投稿、編集、削除、ログイン、ログアウト時にフラッシュメッセージを表示
　・画像アップロード機能 (AWS S3バケット)

## DB設計

ER図

<img width="1440" alt="Screen Shot 2020-12-29 at 22 19 50" src="https://user-images.githubusercontent.com/68426424/103325736-78f4fe80-4a90-11eb-9acc-fc20bb9947d1.png">

### ○各テーブルについて

| テーブル名 | 説明 |
| :---: | :---: |
| users| ユーザー情報 |
| profiles | ユーザーのプロフィール情報 |
| articles | 投稿したBucket Listの情報 |
| achieved_articles | 達成したBucket Listへの情報 |
| comments | ユーザー投稿への、コメントの情報 |
| likes | Bucket Listへの、いいねの情報 |
| thumbs_ups | 達成したBucket Listへの、グットの情報 |
| relationships | フォロー/フォロワーのユーザー情報 |


### ○Bucket List達成機能 関連のポイント
achieved_articleテーブル(達成したBucket List)はarticleテーブル(Bucket List)と繋がっているため、先にBucket Listを作成しないと達成したBucket Listを投稿することはできません。また、投稿する際には、Bucket Listの編集ページの達成フラグカラムから達成済みを選択し、submitして下さい。すると、達成したBucket Listの投稿画面に移行します。仕組みとして、articleテーブルのachievement_flagの値が利用され、articles-controllerのedit-actionでachievement_flagの値が達成になっていれば、達成したBucket Listの投稿画面に遷移するように場合分けしています。

＊すでに達成したBucket Listを投稿した場合は、articleの編集ページからではなく、achieved_articletの編集ページから編集を行って下さい。

