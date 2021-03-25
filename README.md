# 機能
- 「一日で消える」投稿サイト

# デプロイ

- [https://my-uncle-blog-210322.herokuapp.com/](https://my-uncle-blog-210322.herokuapp.com/)

# image
![image](https://user-images.githubusercontent.com/54434253/111978226-0b181a80-8b47-11eb-951b-6f9ef89e8b2c.png)

# 作成経緯

## 課題
- 世の中にヘイトツイートが多すぎる
- ツイートの誤字を修正することができない
- 個人情報がずっと残っているという漠然とした不安

## ユーザーのメリット
- 事前に文章をまとめてからツイートすることで、不安定な文章をツイッターに投稿しなくなる
- 1日で投稿が消えるので、気軽に文章を作成できる
- データがネットに蓄積されないので、世の中からヘイトツイートも減る(バックアップはその場でTwitter共有のみ)
- 個人情報が流出するリスクが低い

## 運営サイドのメリット
- データの管理が楽


# 仕様

- Windows10/WSL/Ubuntu20.04
- Homebrew

- Rails6
- Ruby2.6.5
- Mysql
- Heroku
    - uptimebot
- Bulma

# 今後
## 機能

- [ ]  匿名投稿
- [ ]  今のログイン人数がわかる
- [x]  heroku_scheduleで定期実行
- [x]  1日で勝手に消える
- [x]  Twiに共有できる

## ビュー

- [ ]  search show
- [ ]  デザインの統一性
    - [ ]  色変更
- [ ]  いつでも空間の背景、何も投稿がないときに何を表示するか
- [x]  bulma

### Javascript

- [ ]  タイル状に
- [ ]  Reactに書き換える

## その他

- [ ]  AWS、GCP
