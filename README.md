# RepositoriesSearcher


## 概要
本アプリケーションはGithub上のリポジトリを検索するflutterアプリケーションです。

<hr>

## Getting Started

### 1. このリポジトリのクローン

```sh
git clone https://github.com/GawinGowin/RepositoriesSearcher
```

### 2. コンフィグファイルの用意[Githubのトークンがある場合]

#### 2.1 ファイルをコピーする


```bash
cp .example.config.yaml .config.yaml
```

#### 2.2 `config.yaml` の記入

```yaml title=".config.yaml"
"Authorization": "Bearer <YOUR-TOKEN>"
```
**personal access token** もしくは **GitHub App user access token**  を `<YOUR-TOKEN>` に記入

### 3. アプリの実行

```sh
flutter pub get
flutter run
```
