# SchemaSpyサンプルリポジトリ

## 概要

SchemaSpyを使用するためのサンプルリポジトリ

## 目次

- [SchemaSpyサンプルリポジトリ](#schemaspyサンプルリポジトリ)
  - [概要](#概要)
  - [目次](#目次)
  - [共通事項](#共通事項)
  - [事前準備](#事前準備)
  - [開発環境の詳細](#開発環境の詳細)
  - [開発の進め方](#開発の進め方)
  - [基本コマンド一覧](#基本コマンド一覧)
  - [参考リンク](#参考リンク)

## 共通事項

- [採用Gitの運用ルール](/docs/README.git.md)

## 事前準備

- [開発環境構築](/docs/README.environment-building.md)

## 開発環境の詳細

~~~sh
.
├── .vscode/
│   └── settings.json
├── docs/
│   ├── README.environment-building.md
│   ├── README.git.md
│   ├── README.make.md
│   ├── README.scoop-package.md
│   └── README.scoop.md
├── infrastructure/
│   ├── mysql/
│   │   ├── conf/
│   │   │   └── my.cnf
│   │   ├── sql/
│   │   │   └── dummy_table.sql
│   │   └── Dockerfile
│   ├── nginx/
│   │   ├── conf/
│   │   │   └── default.conf
│   │   └── Dockerfile
│   └── schemaspy/
│       ├── config/
│       │   └── schemaspy.properties
│       └── Dockerfile
├── .dockerignore
├── .env.example
├── .gitignore
├── API.rest
├── compose.yml
├── Makefile
└── README.md
~~~

## 開発の進め方

## 基本コマンド一覧

- [Makeコマンド一覧](/docs/README.make.md)

多用コマンド

~~~sh
# git clone後に初期起動するときのコマンド
make first-up-build

# make first-up-buildを実行した後で再度コンテナ起動したい場合のコマンド
make up ENV=local

# コンテナログを確認するときのコマンド
make logs-f

# compose.ymlに記載しているサービスのコンテナの停止・削除したい場合のコマンド
make down

# compose.ymlに記載している不要なイメージ、ボリュームなどを削除したい場合のコマンド
make down-rmi

# 全体的な不要なリソースの完全削除するコマンド
make down-all
~~~

SchemaSpyを実行する。

~~~sh
make schemaspy-execution
~~~

上記コマンド実行後にschemaspyディレクトリにファイルが生成されたら[リンク](http://localhost:8080/index.html)先に遷移して確認する

## 参考リンク

[Visual Studio Code (VS Code)のオススメ設定と拡張機能の紹介](https://zenn.dev/yutotnh/articles/1577b6dc5ab7d9)
[SchemaSpy GitHubリポジトリ](https://github.com/schemaspy/schemaspy/)
