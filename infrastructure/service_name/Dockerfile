# dockerfileはマルチステージビルドを利用します。
# docker composeまたはdocker buildするときに、(--target development, --target builder, --target staging, --target production)でビルドステージを指定することができます。
## ベースイメージの作成
FROM imageName AS base

## 開発環境のビルド
FROM base AS development

## コンパイル(コンパイル言語時には記載する)
FROM base AS builder

## ステージング環境のビルド
FROM base AS staging

## 本番環境環境のビルド
FROM base AS production
