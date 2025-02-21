# 開発環境構築

## 概要

このリポジトリを利用した開発をする際に事前に構築するべきものの手順を記載

## 目次

- [開発環境構築](#開発環境構築)
  - [概要](#概要)
  - [目次](#目次)
  - [Mac](#mac)
    - [Homebrewのインストール](#homebrewのインストール)
    - [Command Line Toolsのインストール](#command-line-toolsのインストール)
  - [Windows](#windows)
    - [Scoopのインストール](#scoopのインストール)
  - [VSCode](#vscode)
    - [REST Clientのインストール](#rest-clientのインストール)
  - [参考リンク](#参考リンク)

## Mac

### Homebrewのインストール

MacOSやLinuxでは[Homebrew](https://brew.sh/ja/)をインストールすることで開発環境の構築を楽にできます。

### Command Line Toolsのインストール

- 下記を実行することでMakeコマンドが実行可能になります。

~~~sh
xcode-select --install
~~~

## Windows

### Scoopのインストール

- 下記ドキュメントを参考にMakeコマンドのインストールまで行なってください
  - [Scoopのインストールと基本コマンド](README.scoop.md)
  - [Scoopでおすすめのパッケージインストール](README.scoop-package.md)

## VSCode

### REST Clientのインストール

~~~sh
# vscodeのターミナルから下記コマンドを実行することでインストール
code --install-extension humao.rest-client
~~~

※ 詳細の使い方については[リンク](https://shiraberu.tech/2021/11/28/vscode-extension-rest/)を参照のこと。

## 参考リンク
