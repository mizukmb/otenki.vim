# otenki.vim
## 概要
otenki.vimはVimでの作業中に天気予報を知らせるシンプルなプラグインです。

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
:Otenki chiba # 千葉県千葉の今日の天気は晴れです
:OtenkiTomorrow chiba # 千葉県千葉の明日の天気は曇りです
```

グローバル変数 `g:otenki_cityname_data` に見たい地名を指定することもできます。
これにより、デフォルトの地名の変更が可能です。（ない場合は東京がデフォルトとなります）

```
:Otenki # 東京都東京の今日の天気は雨です
:g:otenki_cityname_data = "morioka"
:Otenki # 岩手県盛岡の今日の天気は晴れです
```
引数に指定する地名はローマ字でお願いします（tokyo, kobeなど）。
地名一覧は[こちら](http://weather.livedoor.com/forecast/rss/primary_area.xml)の **cityタグのtitle** を参照下さい。


## 利用APIについて
天気情報はlivedoor提供の[お天気Webサービス](http://weather.livedoor.com/weather_hacks/webservice)を使用しています。

## License
MIT

## Author
[@mizukmb](https://twitter.com/mizukmb)
