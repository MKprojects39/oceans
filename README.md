# 👕 Ocean ～自動コーディネートアプリ～
<br>

## 本番URL

<a href="https://oceanmorningggg.herokuapp.com/" rel="nofollow">https://oceanmorningggg.herokuapp.com/</a>
<br><br>
![ooo](https://user-images.githubusercontent.com/58989336/75613357-f9488b80-5b6f-11ea-99b8-0550a1c7088d.png)

 <h3>Оceanってどんなアプリ？</h3>
  <h5>A.自動コーディネート機能をもった洋服共有SNSアプリです。</h5><br>
  <p>
    ポートフォリオとして、今ご覧いただいているアプリを作りました。
    <br>
    <br>
    
## 経緯
<br>
もともと僕はプログラミングを学習する前から、自動でその日の気温から服を全身選んでくれるアプリが欲しいと思っていました。
<br><br>
そんなわけで大まかな学習が終わったらすぐに、このアプリの実装を開始しました、何とか使用できるレベルに仕上がって嬉しいです。
<br>

## コンセプト

<br>
こちらのアプリを作りたいと思っていた理由は
<br><br>
①朝の準備時間を削減できる<br><br>
②実際外に出るまで熱いか寒いかわからないからです。<br>
<br>気温と服装のミスマッチにより何度も嫌な思いをしました(汗かいたり。。)
<br><br>
1か月ほどでこのアプリ「Ocean]が完成し、それからは毎日自動で服を選んでもらってます。自分の生活に役立つ実用的な物が作成でき良かったです。
<br>
<br>

## 技術的な話

### 環境
・Ruby 2.6.5<br>
・Rails 5.1.7<br>
・MySQL <br>
・cloud9<br>
・Docker<br>
### インフラ
・puma<br>
・AWS <br>
### フロント
・SASS, Bootstrap4<br>
・JQuery<br>
・Vue.js<br>
### バックエンド
・画像アップロード・削除（carrierwave+Amazon S3)<br>
・外部API(気象庁データ、trello)<br>
・ユーザー登録・ログイン機能・フォロー機能<br>
・コメントの 投稿/削除/編集 機能<br>
・いいね機能（Ajax）<br>
・ページネーション機能（Kaminari）<br>
・検索機能(form タグ、投稿からの複数検索)<br>
・タグ付け機能<br>
・Rspec による自動テスト機能<br>



## こだわったところ
<br>
今回現場で使われているであろうをインフラなども積極的に使用し、見やすいサイトになる様にUIデザインも頑張りました。
<br>
また機能設計やデータ設計に関する思考時間も多くとりました。0知識からの実装だったので何を調べて何を学べばいいかを仮設を立て実装していきました。
<br>
具体的には
<br><br>
①外部APIを使用し気象庁から配信されているxmlファイルを読み込み表示させることをしました。
<br><br>
②Trelloのデータを取得し表示させました。
<br><br>
③条件分岐をうまく使い気温に最適な服の組み合わせの表示機能を実装しました。
<br><br>
④メジャーなサイトのデザインや配色をサンプリングしたUI/UXデザインをしました。
<br>
<br>

ご覧いただきありがとうございました！　 presented by <a href="https://my-profile-yk.firebaseapp.com/" target="_blank">Y K</a>
</div>
