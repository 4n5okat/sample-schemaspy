FROM openjdk:11-jre-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    wget \
    graphviz \
    && apt-get clean

# SchemaSpy
## SchemaSpyのバージョン
ENV SCHEMASPY_VERSION=6.2.4
## SchemaSpyのGithub URL
ENV SCHEMASPY_GITHUB_URL=https://github.com/schemaspy/schemaspy/releases/download/v${SCHEMASPY_VERSION}/schemaspy-${SCHEMASPY_VERSION}.jar
## SchemaSpyのダウンロード
RUN wget ${SCHEMASPY_GITHUB_URL} -O /schemaspy.jar

# MySQL connector
## MySQL connector URL(URLが頻繁に変わる可能性がある)
ENV MYSQL_CONNECTOR_URL=https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-j-8.4.0.tar.gz

RUN wget ${MYSQL_CONNECTOR_URL} \
    && tar -xzf mysql-connector-j-8.4.0.tar.gz \
    && mv mysql-connector-j-8.4.0/mysql-connector-j-8.4.0.jar /mysql-connector-java.jar \
    && rm -rf mysql-connector-j-8.4.0 mysql-connector-j-8.4.0.tar.gz

# Copy SchemaSpy properties file
COPY /infrastructure/schemaspy/config/schemaspy.properties /schemaspy.properties

# Run SchemaSpy
# ENTRYPOINT ["java", "-jar", "/schemaspy.jar", "-configFile", "/schemaspy.properties"]
ENTRYPOINT [ "tail", "-f", "/dev/null" ]
