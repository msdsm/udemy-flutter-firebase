# udemy_app

## メモ

### Firebase
- Googleが提供するクラウドベースのBaaS（Backend as a Service）プラットフォーム
- モバイルおよびWebアプリケーションの開発を支援するツールやサービスが含まれる
- 主な機能
  - Authentication：メール、Google、Facebookなどの認証機能を提供
  - Firestore：ドキュメント指向のNoSQLデータベース  
  - Realtime Database：リアルタイム同期が可能なデータベース
  - Cloud Storage：画像や動画などの大容量ファイルを保存するためのクラウドストレージ  
  - Cloud Functions：サーバーレスでバックエンド処理を実行できる機能  
  - Firebase Hosting：静的なウェブサイトやシングルページアプリケーション（SPA）のホスティングが可能  


### FlutterFire
- FlutterアプリケーションからFirebaseサービスを利用するための公式ライブラリ群
- 主なライブラリ  
  - firebase_core：すべてのFirebase機能に必要な基本パッケージ  
  - firebase_auth：Firebase AuthenticationをFlutterから利用可能にするライブラリ
  - cloud_firestore：Cloud Firestoreを操作するためのライブラリ
  - firebase_storage：Firebase Storageを操作するためのライブラリ  
  - firebase_messaging：プッシュ通知（FCM）を受け取るためのライブラリ

### Firebase CLI
- Firebaseのコマンドラインツール  
- Firebaseプロジェクトの管理、デプロイ、エミュレータの起動などが可能
- 主なコマンド
  - `firebase login`：Firebaseにログイン
  - `firebase init`：Firebaseプロジェクトを初期化  
  - `firebase deploy`：Firebaseプロジェクトをデプロイ  
  - `firebase emulators:start`：エミュレータを起動  
  - `firebase logout`：ログアウト

### NoSQL
- Not Only SQLの略
- 以下ある
  - キーバリュー型 : key,valueで管理(Redis, DynamoDB)
  - カラム指向型 : カラムごとに管理(Cassandra, HBase)
  - ドキュメント指向型 : keyに対してドキュメントを格納(MongoDB, Firestore)
  - グラフ指向型 : nodeとrelationを使ってデータを表現(Neo4j)

### ドキュメント指向型NoSQL
- keyに対してドキュメントを格納
- jsonやXMLなど格納可能
- firebaseのfirestoreではkeyを指定してjsonが入る

### StreamBuilder
- Flutterの非同期データの表示に使用されるウィジェット  
- データがストリーム（Stream）を通してリアルタイムに更新されると、ウィジェットも自動的に再描画される
- 主な用途
  - Firestoreのリアルタイムデータの表示（`Firestore.instance.collection(...).snapshots()`）。  
  - APIからの非同期データ取得の表示。  
- 主要なプロパティ
  - stream：非同期データのストリームを指定する。  
  - builder：ストリームのデータを受け取り、UIを構築する関数を定義する。  
- 使い方の例  
```dart
StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('users').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // loading
    } 
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return Text('No Data');
    }
    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return ListTile(
          title: Text(data['name']),
          subtitle: Text(data['email']),
        );
      }).toList(),
    );
  },
)
```# udemy-flutter-firebase
