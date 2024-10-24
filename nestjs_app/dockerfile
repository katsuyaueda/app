# FROM node:20-alpine
# # ビルドツールのインストール
# RUN apk add --no-cache make gcc g++ python3
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# CMD [ "npm", "run", "start:dev" ]


# Node.js の公式イメージを使用
FROM node:16-alpine

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係をインストール
COPY package*.json ./
RUN npm install

# ソースコードをコンテナにコピー
COPY . .

# 環境変数ファイルを読み込む
COPY .env .env

# アプリケーションをビルド
RUN npm run build

# ポート3000を公開
EXPOSE 3000

# アプリケーションを起動
CMD ["npm", "run", "start:prod"]
