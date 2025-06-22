# Swagger UI Test

このリポジトリは、OpenAPI（Swagger）仕様の API ドキュメントを **Swagger UI** で表示・確認するためのサンプルです。

## ✅ 公開URL（GitHub Pages）

> https://ユーザー名.github.io/swagger-ui-test
※ リポジトリが **Public** の場合のみ有効です。

---

## 📁 構成

```
swagger-ui-test/
├── docs/
│   ├── index.html       ← Swagger UI のエントリポイント
│   ├── openapi.yaml     ← OpenAPI 仕様ファイル
│   └── （Swagger UI の dist ファイル一式）
└── README.md
```

---

## 🛠️ ローカルで表示する方法（Pagesが使えない場合）

### 方法1：VSCode + Live Server（推奨）

1. VSCode でこのリポジトリを開く
2. 「Live Server」拡張機能をインストール
3. `docs/index.html` を右クリック →「Open with Live Server」
4. ブラウザで Swagger UI が表示されます

### 方法2：Python HTTP サーバー

```bash
cd docs
python -m http.server 8000
```

ブラウザで http://localhost:8000 を開く

---

## 🧾 OpenAPI ファイル編集

- `docs/openapi.yaml` に API 仕様を記述します
- `docs/index.html` の以下の部分を変更しないように注意：

```js
url: "./openapi.yaml",
```

---

## 🌐 Swagger Editor（オンライン編集も可能）

YAML を手元で編集しなくても、以下からコピペで確認可能：

- https://editor.swagger.io/
- 「File」→「Import File」で `openapi.yaml` を読み込めます

---

## 📌 注意点

- GitHub Pages はリポジトリが **Public** のときのみ有効です
- 機密情報は `openapi.yaml` に絶対に含めないでください

---

## 🗂️ 参考

- [Swagger UI GitHub](https://github.com/swagger-api/swagger-ui)
- [OpenAPI Specification](https://swagger.io/specification/)
