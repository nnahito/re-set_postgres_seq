[日本語]('README_JA.md') | English(Translated by ChatGPT.)

# Re-Set Postgres Sequence Tool
This is a tool that issues SQL statements in PostgresSQL to update sequences to the latest value.

## Usage
We will create Releases soon.

## Development
We are using the [Nim language](https://nim-lang.org/).

### Installing Nim Language
#### Windows
It is convenient to use ChooseNim.
[ChooseNim](https://github.com/dom96/choosenim/releases)

Alternatively, you can use Scoop.
```bash
$ scoop install nim
```


#### Mac
I don't have one, so I'm not sure, but it seems you can install it with choosenim or brew.
[ChooseNim](https://github.com/dom96/choosenim/releases)

```bash
$ brew install nim
```

### Installing Dependencies
#### Within the Program

```bash
$ nimble install
```


#### PC Environment
##### postgres
You need to install postgres, or else you will encounter errors.
[postgres](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

#### gtk-3.0 (Mac only)
Please refer to the following article.
[Article](https://nnahito.com/articles/94)

### Running

```bash
$ nimble run
```