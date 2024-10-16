## 育児記録簿
## サービス概要
「育児記録簿」は、赤ちゃんの母乳、尿、便などの育児データを簡単に時間ごとに記録できるウェブアプリです。子育て中の大人が直感的に使えるシンプルなインターフェースを提供し、使いやすさに重点を置き、複雑な機能を排除して育児の記録を手軽に管理できることを目指しています。
### シンプルなインターフェースの実現方法
視覚的なシンプルさの実現:
- カラーパレットは落ち着いた色を使用し、長時間の使用にも目に負担をかけないようにします。
- アイコンやボタンは大きく、わかりやすい形のものを採用して、すぐに操作に馴染めるようにます。
### 使用頻度が少ない機能を取り入れない:
- 利用頻度の低い機能や複雑な設定は極力採用せず、育児記録簿に必要な最低限の機能をシンプルな作りで実装します。

## このサービスへの思い・作りたい理由
育児中の親は日々たくさんの情報を管理しなければならず、既存のアプリやサービスは機能が多すぎて逆に使いづらいことがあります。このサービスは、そんな親たちが簡単に記録を取り、育児のサポートができるようにしたいという思いから作ろうと考えました。自身の考えや周囲の意見を基に、使いやすさを徹底的に追求していきます。

### ユーザー層について
「育児記録簿」の主なターゲットは、育児中の親や保育者です。この層を対象にした理由は、育児に必要な情報を簡単に管理したいというニーズが高いと考えたからです。また、複雑な操作や多機能が逆に負担になることが多いので、シンプルで使いやすいアプリが求められていると考えています。

### サービスの利用イメージ
ユーザーは、赤ちゃんの母乳や尿、便の記録をウェブブラウザから簡単に入力できるよう実装します。育児の傾向や状態を把握するための有用な情報として活用できます。このシンプルな操作によって、ユーザーは育児の管理をストレスなく行って、育児の質を向上させることができると考えています。

### ユーザーの獲得について
想定するユーザー層に対しては、育児を行なっている知人やや育児情報を発信するSNSなどを通じてサービスを広めていく予定です。また、親たちが利用しやすい点を、機能重視ではなく使いやすさを求めるユーザーにアピールします。ユーザーからのフィードバックを積極的に取り入れながら、継続的な改善を行い、よりよいサービスにしていきます。

### サービスの差別化ポイント・推しポイント
多くの育児管理アプリは機能が多すぎて使いづらいことがありますが、「育児記録簿」は操作性に重点を置き、シンプルで直感的なインターフェースを提供します。
類似サービスで「ぴよログ」というサービス（モバイル）があります、こちらがイメージとは近くなるかと思います。
実装を考えているWEBサービスと「ぴよログ」とでは機能の数に差があります。
グラフ表示機能やタイマー機能など沢山あるけれど使いこなせていない人は多いと感じます。
実際に身内や知人に話を聞いたところ、記録をつけるのが目的なのに機能が多すぎて使用をやめたとのことでした。
そこで私はユーザビリティに特化し、複雑な機能を使わず、
必要な情報だけに集中することで、ユーザーがストレスなく使える点が他のサービスとの大きな差別化ポイントと考えています。


### 画面遷移図
Figma：https://www.figma.com/design/oed4cgoy5weIxrCiIyXW3M/%E7%84%A1%E9%A1%8C?node-id=0-1&t=U60O5KGAWVRWaFiM-1

### READMEに記載した機能
- [x] ユーザー登録機能
- [x] ログイン機能
- [x] ログアウト機能
- [x] パスワード変更機能
- [x] 記録投稿機能
- [x] 記録閲覧機能
- [x] 記録編集機能
- [x] 記録削除機能

### メールアドレス・パスワード変更確認項目
直接変更できるものではなく、一旦メールなどを介して専用のページで変更する画面遷移になっているか？
- [x] パスワード

### 各画面の作り込み
画面遷移だけでなく、必要なボタンやフォームが確認できるくらい作り米ているか？
- [x] 作り込みはある程度完了している（Figmaを見て画面の作成ができる状態にある）
### 機能候補
MVPリリース時に実装予定の機能
記録機能: 母乳、尿、便などのデータを簡単に入力・管理できる基本機能
データ表示: 記録されたデータを時間ごとに一覧表示し、視覚的に把握できる機能
アカウント管理: ユーザー登録、ログイン、ログアウト機能
本リリースまでに実装予定の機能
データ共有機能: 複数のデバイスや家族とデータを共有できる機能
機能の実装方針予定
記録機能: Ruby on RailsのActiveRecordを使用してデータベースに保存し、フォームのバリデーションにはRailsの標準機能を活用します。
データ共有機能: ActionCableを用いたリアルタイム更新や、ユーザー認証にはDevise、もしくはsorceryを利用して安全にデータ共有を実現します。

## ER図の作成
https://gyazo.com/e67bc692cb5469beb5c074808e05fe56

## 修正及びテスト内容
指摘いただいた箇所の修正と以下のテスト、実装を行いました。
- [x] 「うんち」項目は必須ではないため、制約を解除後、rails db:migrate実施。
- [x] 新規登録ページのフラッシュメッセージ追加。
- [x] ログインページのフラッシュメッセージ追加。
- [x] 「きろくをつける」ページの「うんち」項目をチェックを入れずにデータ画面に遷移するかのテスト
