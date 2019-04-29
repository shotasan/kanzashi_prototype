# README

### 概要
***
購入した珈琲豆の味やその他の情報を管理できます。<br>
好きな珈琲豆を組み合わせて自分だけのオリジナルブレンドを作るのに役立ちます。<br>
他ユーザーがお気に入りしている珈琲豆の情報を見れるので、今まで飲んだことのない珈琲にチャレンジできます。

### コンセプト
***
珈琲豆の情報管理アプリ

### バージョン
***
Ruby 2.6.1<br>
Rails 5.2.3

### 機能一覧
***
- [ ] ログイン機能
- [ ] ユーザー登録機能（deviseを使用)
    - [ ] メールアドレス、名前、パスワードは必須
- [ ] 登録情報一覧表示機能
    - [ ] 登録情報にコメントが可能
    - [ ] 名称での検索が可能
- [ ] 新規登録機能
- [ ] 登録内容詳細機能
    -  [ ] 評価した味がレーダーチャートで表示される
-  [ ] 登録内容編集機能
-  [ ] 登録内容削除機能
    -  [ ] 編集と削除は投稿者のみ実行可能
-  [ ] お気に入り機能
    -  [ ] 自分がお気に入りした情報を一覧で見れる
    -  [ ] 他ユーザーが登録した珈琲豆の情報をお気に入りできる
    -  [ ] 自分が登録した珈琲豆の情報をお気に入りできる
    -  [ ] 他ユーザーが登録したブレンド珈琲の情報をお気に入りできる
    -  [ ] 自分が登録したブレンド珈琲の情報をお気に入りできる
- [ ] コメント機能
    - [ ] 他ユーザーが登録した珈琲豆の情報にコメントできる
- [ ] コメント編集機能
- [ ] コメント削除機能
    - [ ] 編集と削除は投稿者のみ実行可能
- [ ] コメント機能にはAjaxを使用

### カタログ設計
***
https://docs.google.com/spreadsheets/d/1E7y5Z1LIySGGrmhaTWlRDK5h_OZuT_FdoOCtZhVZuuw/edit#gid=1177389026

### テーブル定義
***
https://docs.google.com/spreadsheets/d/17MM4I3yb0arznbqWMRCEV6bZ9r5BPIVPU4himnJEWgw/edit#gid=1224643633

### ER図
***
https://cacoo.com/diagrams/5lDeaHfITpyQhqw8/87635

### 画面遷移図
***
https://cacoo.com/diagrams/paySif2Aqxq8uOUM/DCAEA

### 画面ワイヤーフレーム
***
https://cacoo.com/diagrams/67hqHoqehKJMqTKj/8D9A8

### 使用予定Gem
* carrierwave
* mini_magick
* devise
* ransack
* RuboCop
* Kaminari
* Bootstrap
* bullet
* factory_girl
