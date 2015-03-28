# otenki.vim
## 概要
otenki.vimはVimで天気予報が見れるシンプルなプラグインです。

![otenki.vim](http://i.imgur.com/o6sgbL8.gif)

## インストール
このプラグインは [mattn/web-api](https://github.com/mattn/webapi-vim)を利用しています。
otenki.vimと一緒にインストールをお願いします。

## 使い方
コマンドを3種類用意しました。

```
:Otenki
:OtenkiTomorrow
:OtenkiAfterTomorrow
```

それぞれ、`今日`、`明日`、`明後日`の天気予報を見る事ができます。
引数に地名を指定することもできます。

```
:Otenki # 東京都東京の今日の天気は晴れです
:Otenki chiba # 千葉県千葉の今日の天気は晴れです
:OtenkiTomorrow chiba # 千葉県千葉の明日の天気は曇りです
```

グローバル変数 `g:otenki_cityname_data` で見たい地名を指定することができます（デフォルトは東京です）。
vimrcに記述して下さい。

```
:let g:otenki_cityname_data = "morioka"
:Otenki # 岩手県盛岡の今日の天気は晴れです
```

引数に指定する地名はローマ字でお願いします（tokyo, kobeなど）。
地名一覧は[こちら](http://weather.livedoor.com/forecast/rss/primary_area.xml)の **cityタグのtitle** を参照下さい。
Wikiにも書いたのでそちらからもどうぞ。

また、今日の天気をステータスラインに表示するための関数を用意しました。
天気予報をよりシンプルな形で表示することができます。
vimrcに以下のように記述して下さい。

```
set statusline=%{g:MyStatusOtenki}
```

各種ステータスラインプラグイン（e.x. [lightline.vim](https://github.com/itchyny/lightline.vim)等）を利用している場合は、上記の方法では設定できない可能性がございます。

## 利用APIについて
天気情報はlivedoor提供の[お天気Webサービス](http://weather.livedoor.com/weather_hacks/webservice)を使用しています。

## License
MIT

## Author
[@mizukmb](https://twitter.com/mizukmb)
