# Bucket List
人生でやってみたいこと・挑戦したいことを投稿するSNSアプリです。

URL：

# アプリ概要
こちらのアプリのコンセプトは、以下の３つです。

・自分が挑戦したいことをリスト化することで、人生の中で本当にしたいことの明確する<br>
・投稿・コメント機能通じて、他のユーザーとの交流、そしてインスパレーションを受ける<br>
・今度は自分がインスピレーターとしての価値をユーザーに届ける<br>

基本的にはtwitterのような投稿、コメント、いいね、フォロー機能のあるSNSですが、 その他に以下のような特徴のあるアプリです。

アプリから、Bucket Listを作成、編集、削除できる<br>
設定したBucket Listを達成できた場合は、編集ページの達成フラグから達成Bucket Listに自動的に移行される<br>

# 開発した背景

　Bucket Listという言葉を初めて知ったのは、友達のアメリカ人と話していたときです。<br>
Do you have somehting that you'd like to in the line like skydiving?
とこの先何か挑戦してみたいことがあるかを尋ねたときに、You mean Bucket List?? とそのとき初めてBucket Listという言葉の存在を知りました。

それがBucket Listというアプリケーションを作ろうと思ったきっかけです。

しかし、いざBucket Listを作ろうとペンと紙を用意したのですが、なかなか思い浮かばない。

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
　今、世界中の人々がコロナウイルスで挑戦したいことができなかったり、したくてもできない環境にいます。しかしながら、この期間をポジティブに考え、本当にしたいことは何かを考え、準備するいい機会だと私は思いました。人類がコロナウイルスが打ち勝ったときに、すぐに動きだせるようにこのアプリが少しでも手助けできればと思いました。<br>
　
このような背景から、Bucket Listをリスト化するアプリを作ってみたい思い、実装を開始しました。

使用画面のイメージ

# 使用技術

### ○フロントエンド
HTML / SCC / Sass / Bootstrap / slick
jquery-rails　4.4.0

### ○バックエンド

Ruby 2.6.5
rails 6.0.3

### ○インフラ
sqlite3 1.4.2
AWS ( EC2, S3, Route53, VPC, IAM )

### ○その他使用ツール
Visual Studio Code
AWS構成図


# 機能一覧

#### ○ユーザー登録関連
　新規登録、プロフィール編集機能
　ログイン、ログアウト機能

#### ○Bucket Listの投稿機能(CRUD)
　Bucket Listの新規作成、一覧表示、編集、削除機能

#### ○達成したBucket Listの投稿機能(CRUD)
　達成したBucket Listの作成、一覧表示、編集機能

　Bucket Listを新規作成し、それを達成することができた場合、編集ページの達成フラグから達成を選択すると、達成したBucket Listのページに飛ぶ。
　そして、感想やアドバイスなどのカラムを記入すると、達成済みBucket Listに移行される。

　動画explain

　また、このとき写真を複数投稿でき、写真をスライドしてみることができる

　動画explain

　ホームページの左上のBucket Listを押すと全ユーザーが投稿したBucket Listをみることができ、Bucket Listのタグを押すと、フォローしているユーザーのBucket List、達成できたBucket Listのタグを押すと、フォローしているユーザーの達成したBucket Listを閲覧することができます。

動画explain

#### ○コメント機能(CRUD)
　達成したBucket Listにコメント作成、一覧表示、編集、削除機能

#### ○いいね機能 (jquery)
　新規作成したBucket Listにいいねボタン

#### ○フォロー機能(ajax)
　ユーザーのプロフィールからフォロー、アンフォローできる

#### ○グット機能(ajax)
　達成したBucket Listにグットボタン

#### ○投稿、編集、削除、ログイン、ログアウト時にフラッシュメッセージを表示
　画像アップロード機能 (AWS S3バケット)

ハンバーガーメニュー(jQuery)
DB設計
ER図
AsaKotsu_ERD

### 各テーブルについて
テーブル名	説明
users	:ユーザー情報<br>
profiles :ユーザーのプロフィール情報<br>
articles	:投稿したBucket Listの情報<br>
achieved_articles :達成したBucket Listへのの情報<br>
comments :ユーザー投稿への、コメントの情報<br>
likes	:Bucket Listへの、いいねの情報<br>
thumbs_ups :達成したBucket Listへの、グットの情報<br>
relationships	:フォロー/フォロワーのユーザー情報<br>


### Bucket List達成機能 関連のポイント
achieved_articleテーブル(達成したBucket List)はarticleテーブル(Bucket List)と繋がっているため、先にBucket Listを作成しないと達成したBucket Listを投稿することはできません。また、投稿する際には、Bucket Listの編集ページの達成フラグカラムから達成済みを選択し、submitして下さい。すると、達成したBucket Listの投稿画面に移行します。仕組みとして、articleテーブルのachievement_flagの値が利用され、articles-controllerのedit-actionでachievement_flagの値が達成になっていれば、達成したBucket Listの投稿画面に遷移するように場合分けしています。

＊すでに達成したBucket Listを投稿した場合は、articleの編集ページからではなく、achieved_articletの編集ページから編集を行って下さい。

