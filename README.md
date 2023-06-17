# RealWorld

## 概要
Rails API学習用のリポジトリです。

課題として、[RealWorld の バックエンドの API](https://realworld-docs.netlify.app/docs/specs/backend-specs/introduction) の仕様を満たす Rails API を作成します。

### 課題1
RealWorld の API のうち、次のエンドポイントを実装してください。

- [Registration](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#registration)

その際に、[API spec](https://github.com/gothinkster/realworld/tree/main/api) と呼ばれている [Postman のテスト(Conduit.postman_collection.json)](https://github.com/gothinkster/realworld/blob/main/api/Conduit.postman_collection.json)の該当する箇所が通るように実装してください(該当箇所以外のテストは削除するとテストしやすいです)。

### 課題2

minitest もしくは RSpec を使って、2-1 のエンドポイントのテストを書いてください。

### 課題3

次のエンドポイントを実装してください。

- [Authentication](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#authentication)

その際に、Postman のテストの該当する箇所が通るように実装してください。

### 課題4

次のエンドポイントを実装してください。

- [Create Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#create-article)
- [Get Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#get-article)
- [Update Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#update-article)
- [Delete Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#delete-article)

その際に、Postman のテストの該当する箇所が通るように実装してください。

なお、Article に関わる要素のうち、タグ及びお気に入り(`favorite`) は実装しなくてよいものとします。Postman のテストからも該当箇所のコードは削除し除外してください。


## 課題の確認について
今回環境構築には、Dev Container TemplateのRubyを使用しています。次の手順は、Visual Studio Code Dev Containersエクステンションが予めインストールされていることが前提です。
1. ターミナル上で次のコマンドを実行してください。

```
git clone https://github.com/masa-kogi/realworld.git
cd realworld
code .
```

2. VSCodeが開いたら、コマンドパレットからDev Containers: Reopen in Containerコマンドを実行してください。

3. コンテナ内で再度VSCodeが開いたら、ターミナルを表示し、`bundle install`コマンドを入力してください。

4. `rails s`コマンドを入力し、サーバーを立ち上げてください。

5. 別のターミナルを表示し、`APIURL=http://localhost:3000/api ./run-api-tests.sh`コマンドを実行してください。テストが全て成功すれば、課題1、3、4の実装ができていることが確認できます。

6. ターミナル上で、`bundle exec rspec spec/requests/api/users_spec.rb`コマンドを実行してください。テストが成功すれば、課題2の実装ができていることが確認できます。

### 文責
- 小木曽 将弘
