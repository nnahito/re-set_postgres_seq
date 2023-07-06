日本語 | [English](README.md)

# Re-Set Postgres Sequence Tool
PostgresSQLで、Sequenceを最新に更新するためのSQLを発行するツールです。  

## 使い方
そのうち、Releases作ります


## 開発
[Nim言語](https://nim-lang.org/)を利用しています。  

### Nim言語のインストール
#### Windows
ChooseNimを使うと便利  
https://github.com/dom96/choosenim/releases

またはScoopとか
```bash
$ scoop install nim
```

#### Mac
持ってないのでわからないけど、choosenimでもbrewで入るらしい。  
https://github.com/dom96/choosenim/releases

```bash
$ brew install nim
```

### 依存ライブラリのインストール
#### プログラム内
```bash
$ nimble install
```

#### PC環境
##### postgres
postgresを入れておかないとエラーになります。  
https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

#### gtk-3.0（Macのみ）
以下記事を参考にどうぞ  
https://nnahito.com/articles/94


### 起動
```bash
$ nimble run
```