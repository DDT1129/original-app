# アプリケーション名

BCON

# アプリケーション概要

- 自身の安否状況を外出、帰宅の都度発信することにより、家族が安否確認のために無駄に連絡を取り合う必要をなくし、その負担やストレスを軽減します。
- メモを作成した場合は、安否状況と共に表示してメモがあることをお知らせします。
- ユーザーである他の家族とメモを共有して普段の生活で互いにタスク管理をするよにして使うことができます。
- 家族が同じ家で生活していない場合でも、このようにアプリ上で繋がることで安心感を得ることができます。

# URL

https://originalapp-ddt.onrender.com/

# テスト用アカウント

- Basic認証パスワード:aihonorin
- Basic認証ID:8790
- 現在、Basic認証は外してあります。
- ユーザー1
 - メールアドレス:1@test.com
 - パスワード:d000000
- ユーザー2
 - メールアドレス:2@test.com
 - パスワード:d000000

# 利用方法

## 外出、帰宅を表示

1. トップページ（一覧ページ）のヘッダーから新規登録を行い家族アカウント登録ページに遷移します。
2. 新規登録時に入力した「家族コード」を再度入力し、家族アカウントを登録します。
3. トップページの「外出・帰宅」のカエルマークから入力フォームがあるページに遷移し、外出、帰宅の別を選択し登録します。（目的欄は任意で入力）
4. 選択したワードと登録した時点から経過した時間が計算され、経過時間が表示されます。
5. 外出と帰宅の都度登録することで、家族間で安否状況を共有することができます。

## 共有メモ

1. 新規登録、家族アカウント登録後にトップページ（一覧ページ）の「メモ」のカエルマークからメモ一覧ページに遷移します。
2. ページ中央にある新規メモ作成ボタンから、メモを作成します。
3. メモ一覧ページに表示されたメモは家族間で共有するため、表示されたメモの隣にある各種ボタンから編集、削除、完了チェックをすることができます。
4. メモがある場合は、トップページ（一覧ページ）に「！メモがあります」とユーザーの欄にお知らせが表示されます。これをクリックするとメモ一覧に遷移します。

# アプリケーションを作成した背景
- 私の仕事での経験ですが、別居している高齢の親が心配なので見にいって欲しいといった依頼の電話がよく入ったり、逆に、一人暮らしをしている高齢の方は、防犯面で不安を抱えているが、家族に迷惑をかけられないということで孤立するケースもよく見られました。
- 安否確認は、電話やメール、LINEなどのツールを使って連絡すれば済む話ですが、仕事をしている家族にとって朝も夜も毎日のように連絡することはとても労力がいることでそれなりの負担とストレスがかかることがこれまでの経験で分かりました。
- 加えて現代は共働き世帯が多く、家にはいつも子供が1人でいるといった世帯も多い中、世の中では様々な凶悪犯罪が後を絶たない状況にあり、日常において家族の安否確認は不可欠なものであると考えました。
- これらの問題を少しでも解決するために、外出・帰宅といった日常必ず起こすアクションに絞って安否状況を発信することで負担やストレスをかけることなく家族の安否確認ができ、かつ日常的に家族がアプリで繋がることで安心感を醸成できるアプリケーションを開発することにしました。

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1ICwQnlxfaYmIxLdPOOpohC0UZrINYS4Xf901DKf8Mb0/edit#gid=982722306

# 実装した機能及び説明（画像）

<img width="894" alt="776e816b8fc00ff40d2bd7ac6d9c9527" src="https://github.com/DDT1129/original-app/assets/128135841/89c41d68-7945-4bc9-90de-365a3e9149dc">
<img width="879" alt="e97f1424df71134365ff4f1b3d8f4d67" src="https://github.com/DDT1129/original-app/assets/128135841/a8e6a8c8-8c0e-4fb5-9a99-5b4cf3804366">
<img width="865" alt="e9a7e2d5b7686d51b634168ea8f9847e" src="https://github.com/DDT1129/original-app/assets/128135841/7c350381-abbe-4e34-a48b-7e3528df1bd9">

# 実装予定の機能
- 現在、より直感的かつ効率的に操作できるようページ遷移した先のフォームからの入力ではなく、外出、帰宅時にボタンを押すことで表示切り替えできるような機能を思考中です。
- 具体的には、Iotデバイス（ソラコム製のボタンなど）をAWSのIotCoreと通信させ、MQTTメッセージをrailsで受け取れるようにgemをインストール設定しておくことで、ボタンが押されればリアルタイムで受信できるような設定にしたいです。
- 今後は、よりシンプルに使用できるよう新規登録時のemailなどの項目を減らしつつもセキュリティー面での向上を考えて、クライアント側がランダムに生成したユーザー識別コードを提供し、識別コードをユーザー間で承認する形で初めてアプリが利用できるようなセキュリティー機能や子供が使用することも考慮し、楽しんでアプリを積極的に使ってもらえるよう外出、帰宅の通知回数に応じてイベント機能を実装することも考えています。
- 例えば回数に応じてユーザーを表すカエルのイメージが徐々にオタマジャクシからカエルに成長する機能などをつけることで、それを楽しみにした子供が自ら朝学校に登校する準備をしてスムーズに登校できるようになれば、朝の忙しい時間帯も余裕を作れるようになると思うので、このような機能も追加で実装予定です。

# データベース設計

![database](https://github.com/DDT1129/original-app/assets/128135841/36537632-931b-44ee-9af7-868b17717ce9)

# 画面遷移図

![screen_transition](https://github.com/DDT1129/original-app/assets/128135841/83c097fe-d52d-4374-ae12-b23cf79fabd6)

# 開発環境

- ruby,ruby on rails
- MySQL
- フロントエンド
- バックエンド
- インフラ(Render)
- テスト
- テキストエディタ(VSCode)
- タスク管理(GitHub)

# ローカルでの動作方法

以下のコマンドを順に実行。
% git clone https://github.com/DDT1129/original-app.git  
% cd original-app  
% bundle install  
% yarn install  

# 工夫したポイント

- 主な利用者を高齢者と子供と想定したとき、無駄な機能は省いて必要最低限の機能のみ実装し、直感的に操作ができることを大前提に作成しました。表示される項目は、「外出」「帰宅」の2種類しかないのですが、さらに分かりやすくカエルのイメージを種類別に表示するようにしました。（飛び跳ねるカエル＝「外出」）（横になるカエル＝「帰宅」）
- 安否状況を発信した時刻も一目でわかるように、通知した時刻から現在までの経過時間を計算して、「（例）⚪︎分前に外出」といった表示がされるようにしました。
- 日常的に使えるようにプラスアルファの機能でメモアプリを実装しましたが、家族で共有できるようにあえて編集、削除といった機能権限を設定しないで家族間で自由に使えるようにしました。また、メモにチェック機能をつけることでタスク管理のようにして普段使いでも活かせるようにしました。
- プライバシーな情報を扱うため、家族アカウント機能を設定し、バリデーションを複数箇所に設定してセキュリティ対策をしました。

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