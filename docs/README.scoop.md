# Scoopのインストールと基本コマンド

## 概要

Windows用のパッケージ管理ツールのScoopをインストールする方法。

## 初めに

有名どころではWindows用のパッケージ管理ツールはchocolatyが有名ですが、入れるパッケージによってはかなり古いバージョンが入る場合がありあります。 \
Scoopでは比較的新しいバージョンが入るものが多いためScoopをおすすめします。

## 目次

- [Scoopのインストールと基本コマンド](#scoopのインストールと基本コマンド)
  - [概要](#概要)
  - [初めに](#初めに)
  - [目次](#目次)
  - [必要要件](#必要要件)
  - [Scoopのインストール](#scoopのインストール)
  - [Scoopコマンド一覧](#scoopコマンド一覧)
    - [help](#help)
    - [search](#search)
    - [bucket](#bucket)
    - [install](#install)
    - [list](#list)
    - [info](#info)
    - [status](#status)
    - [update](#update)
    - [uninstall](#uninstall)
  - [参考リンク](#参考リンク)

## 必要要件

ScoopをインストールするにはPowerShell 5と.Net Framework 4.5以上が必要になります。 \
はWindows10以降でしたら特に問題なく動作すると思います。

## Scoopのインストール

コマンドが変更になっている可能性もあるため[公式リンク](https://scoop.sh/)で確認推奨 \

下記コマンドを`PowerShell`で実行します

~~~sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
~~~

ポリシー変更のメッセージが表示されたら`Y`を入力してインストールを続けてください。

~~~sh
Execution Policy Change
The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the
about_Execution_Policies help topic at https:/go.microsoft.com/fwlink/?LinkID=135170.
Do you want to change the execution policy?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): Y
~~~

インストールが完了したらScoopを利用できるようになります。

## Scoopコマンド一覧

コマンドはPowerShellで行うとユーザー環境変数に変更があった際にも即時反映されます。

### help

~~~sh
# Scoop全体のヘルプを表示
scoop help

# 任意のサブコマンドのヘルプを表示
scoop help ${サブコマンド名}
~~~

### search

~~~sh
# Scoop全体でインストール可能なアプリを表示
scoop search

# 検索文字列にヒットするものを表示
# パイプで複数検索したりも可能その際にはregexはシングルクォーテーションで囲むと良い
scoop search ${文字列}
~~~

### bucket

~~~sh
# 下記コマンドで表示されるバケットはURL指定なしでBucket名だけで登録することが可能
# Main, Extras, Version, PHP, Java, Gamesの6つに関してはScoopチームが管理するサーバーでBucket内のアプリ情報を自動更新しているため、古いバージョンがScoopからインストールされることを防いでいます
scoop bucket known

# バケットの追加(knownの一覧に表示されるもの)
scoop bucket add ${バケット名}

# バケットの追加(knownの一覧にないもの)
scoop bucket add ${バケット名} ${GitリポジトリURL}

# 追加したバケットの一覧表示
scoop bucket list

# バケットの削除
scoop bucket rm ${バケット名}
~~~

### install

~~~sh
# Bucketにあるもののみインストール可能、もし追加しているBucketになければ新たにBucketする必要あり
scoop install ${パッケージ名}
~~~

### list

~~~sh
# インストール済みパッケージの一覧表示
scoop list

# 文字列でグレップすることも可能
scoop list ${パッケージ名}
~~~

### info

~~~sh
# インストールパッケージの詳細を確認
scoop info ${パッケージ名}
~~~

### status

~~~sh
# インストールしたパッケージのステータスを確認
scoop status
~~~

| ステータス項目 | 説明 |
| ---- | ---- |
| Installed Version | 現在のバージョン |
| Latest Version | 最新バージョン |
| Missing Dependencies | 解消できていない依存関係 |
| Info | その他 |

### update

~~~sh
# Scoop自身を更新するコマンド(インストールパッケージの更新はされない)
scoop update

# インストールパッケージの更新(パッケージが起動中だと更新できないのでいったん終了させてから行う)
# スペース区切りで複数パッケージを指定できる。
scoop update ${パッケージ名}
~~~

### uninstall

~~~sh
# パッケージをアンインストールするコマンド
scoop uninstall ${パッケージ名}
~~~

## 参考リンク

[公式サイト](https://scoop.sh/) \
[公式Githubリポジトリ](https://github.com/ScoopInstaller/Scoop#readme)
