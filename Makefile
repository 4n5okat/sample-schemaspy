# .env ファイルが存在する場合のみ include
ifneq ("$(wildcard .env)", "")
  include .env
  export
endif

# コマンドリスト

#####################################################
## Dockerコマンド
#####################################################

#----------------------------------------------------
### コンテナ起動・作成系
#----------------------------------------------------

#### git clone後に初期起動するときのコマンド
first-up-build:
	cp .env.example .env

#### サービスのビルドを実行します。
build:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
else
	@echo "Using ENV=${ENV}"
	docker compose --profile ${ENV} build
endif


#### サービスのビルドからコンテナ作成、起動までをバックグランドで行います。
build-up:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
endif

	@echo "Using ENV=${ENV}"

ifeq ($(ENV),local)
	@make create-db-secrets
	docker compose --profile ${ENV} up -d --build
	docker compose exec mysql bash -c "cp /run/secrets/db_secret_file /tmp/db_secret_file"
	docker compose exec mysql bash -c "chmod 600 /tmp/db_secret_file"
else ifeq ($(ENV),dev)
	docker compose --profile ${ENV} up -d --build
else
	@echo "Error: Unsupported ENV value '${ENV}'"
	@exit 1
endif


#### コンテナを作成して、起動します。オプションで-dをつけることでバックグラウンドで実行することができます。
up:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
endif

	@echo "Using ENV=${ENV}"

ifeq ($(ENV),local)
	@make create-db-secrets
	docker compose --profile ${ENV} up -d
	docker compose exec mysql bash -c "cp /run/secrets/db_secret_file /tmp/db_secret_file"
	docker compose exec mysql bash -c "chmod 600 /tmp/db_secret_file"
else ifeq ($(ENV),dev)
	docker compose --profile ${ENV} up -d
else
	@echo "Error: Unsupported ENV value '${ENV}'"
	@exit 1
endif


#### 構築されたサービスを参考にそのコンテナを作ります。
create:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
endif

	@echo "Using ENV=${ENV}"

ifeq ($(ENV),local)
	@make create-db-secrets
	docker compose --profile ${ENV} create
	docker compose exec mysql bash -c "cp /run/secrets/db_secret_file /tmp/db_secret_file"
	docker compose exec mysql bash -c "chmod 600 /tmp/db_secret_file"
else ifeq ($(ENV),dev)
	docker compose --profile ${ENV} create
else
	@echo "Error: Unsupported ENV value '${ENV}'"
	@exit 1
endif


#### コンテナを再起動します。
restart:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
endif

	@echo "Using ENV=${ENV}"

ifeq ($(ENV),local)
	@make create-db-secrets
	docker compose --profile ${ENV} restart
	docker compose exec mysql bash -c "cp /run/secrets/db_secret_file /tmp/db_secret_file"
	docker compose exec mysql bash -c "chmod 600 /tmp/db_secret_file"
else ifeq ($(ENV),dev)
	docker compose --profile ${ENV} restart
else
	@echo "Error: Unsupported ENV value '${ENV}'"
	@exit 1
endif

#----------------------------------------------------
### コンテナ停止・削除系
#----------------------------------------------------

#### compose.ymlに書かれているサービスを参考にコンテナを停止し、そのコンテナとネットワークを削除します。
down:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
else
	@echo "Using ENV=${ENV}"
	docker compose --profile ${ENV} down
endif

#### compose.ymlに書かれているサービスを参考に停止中のコンテナを削除します。
rm:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
else
	@echo "Using ENV=${ENV}"
	docker compose --profile ${ENV} rm
endif

#### compose.ymlに書かれているサービスを参考にコンテナ、イメージ、ボリューム、ネットワークそして未定義コンテナ、全てを一括消去するコマンド
down-rmi:
	docker compose down --rmi all --volumes --remove-orphans

#### 全ての未使用なコンテナ, イメージ, ボリューム、ネットワークを一括削除
down-all:
	docker system prune --volumes

#----------------------------------------------------
### コンテナ操作系
#----------------------------------------------------

#### コンテナを強制停止します。
kill:
	docker compose kill

#### サービスを開始します。これは既にコンテナがある状態でなければなりません。
start:
	docker compose start

#### サービスを停止します。
stop:
	docker compose stop

#### サービスを一旦停止します。
#### (一時停止したサービスは強制削除、強制開始ができずunpauseをしてからでないと作業ができなくなるので注意してください。)
pause:
	docker compose pause

#### サービスの再開をします。pauseしている状態から復帰するのですが、pauseしている状態から復帰するにはこのコマンドが必要です。
unpause:
	docker compose unpause

#----------------------------------------------------
### コンテナ情報系
#----------------------------------------------------

#### サービスのログを出力します。
logs:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
else
	@echo "Using ENV=${ENV}"
	docker compose --profile ${ENV} logs
endif

#### サービスのログをリアルタイムに出力します。
logs-f:
ifeq ($(ENV),)
	@echo "Error: Please specify a valid environment with ENV=<environment>"
	@exit 1
else
	@echo "Using ENV=${ENV}"
	docker compose --profile ${ENV} logs -f
endif

#### コンテナの一覧を表示します。
ps:
	docker compose ps

#### 各コンテナのプロセス情報を表示します。
top:
	docker compose top

#### compose.ymlで書かれてる内容が表示されます。
config:
	docker compose config

#### コンテナからのイベントを受信します。
events:
	docker compose events

#----------------------------------------------------
### Docker補助/etc系
#----------------------------------------------------

#### コマンドの一覧を表示します。
help:
	docker compose help

#### docker composeのバージョンを表示します。
version:
	docker compose version

#### DAB(Distributed Application Bundles)を作成します。
#### これは事前に作成したイメージをdockerのregistryにpushしておく必要があります(ローカルにpushでも可)
bundle:
	docker compose bundle

#### 対象のイメージの情報を表示します。
images:
	docker compose images

#### サービスのイメージをプルしてきます。
pull:
	docker compose pull

#----------------------------------------------------
### container
#----------------------------------------------------

# SchemaSpy
## SchemaSpyコンテナログイン
schemaspy-login:
	docker compose exec schemaspy bash

## SchemaSpy実行
schemaspy-execution:
	docker compose exec schemaspy bash -c "java -jar /schemaspy.jar -configFile /schemaspy.properties"

# MySQL
## MySQLコンテナにログイン
mysql-login:
	docker compose exec mysql bash

## MySQLにログインする
db-connection:
	docker compose exec mysql bash -c "mysql --defaults-extra-file=/tmp/db_secret_file"

# Database接続のシークレットファイルを作成
create-db-secrets:
	echo "[client]" > db_secret.txt
	echo "host=$(MYSQL_HOSTS)" >> db_secret.txt
	echo "port=$(MYSQL_PORTS)" >> db_secret.txt
	echo "user=$(MYSQL_USER)" >> db_secret.txt
	echo "password=$(MYSQL_PASSWORD)" >> db_secret.txt
