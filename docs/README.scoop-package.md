# Scoopでおすすめのパッケージインストール

## 概要

おすすめパッケージのインストール方法

## 前提条件

[ScoopをWindowsマシンにインストール済みのこと](README.scoop.md)

## 目次

- [Scoopでおすすめのパッケージインストール](#scoopでおすすめのパッケージインストール)
  - [概要](#概要)
  - [前提条件](#前提条件)
  - [目次](#目次)
  - [おすすめパッケージ一覧](#おすすめパッケージ一覧)
  - [パッケージインストール手順](#パッケージインストール手順)
    - [バケットの追加](#バケットの追加)
    - [パッケージのインストール](#パッケージのインストール)
  - [参考リンク](#参考リンク)

## おすすめパッケージ一覧

| パッケージ名 | バケット名 | 用途 |
| ---- | ---- | ---- |
| 7zip | main | 圧縮・解凍ソフト |
| dbeaver | extras | データベースクライアントツール |
| filezilla | extras | FTPソフト |
| git | main | 分散型バージョン管理システム |
| googlechrome | extras | Webブラウザ |
| make | main | ビルドツール |
| notion | extras | クロスプラットフォームのフリーミアムのメモ取りウェブアプリ |
| obs-studio | extras | 配信ソフト |
| slack | extras | コミュニケーションツール |
| teraterm | extras | ターミナルエミュレータ(Scoopでは5.xをインストールすることができる) |
| vscode | extras | コードエディタ |

## パッケージインストール手順

### バケットの追加

おすすめパッケージ一覧をインストールする際にはmainとextrasの二つのバケットが必要となる。 \
mainはデフォルトで入っているので下記コマンドでextrasを追加する

~~~sh
scoop bucket add extras
~~~

### パッケージのインストール

~~~sh
scoop install 7zip dbeaver filezilla git googlechrome make notion obs-studio slack teraterm vscode
~~~

## 参考リンク
