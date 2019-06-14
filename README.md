# TransmissionProject

Transmission を ECS で必要なときだけ可動させるプロジェクト

## What is it

対象のS3バケットにtorrentファイルを設置すると、自動的にECSが立ち上がり、ダウンロードを開始する。  
ダウンロードが終わると自動的に、インスタンスごと稼働を停止させる。

## Installation

```bash
# in development
cp .env.sample .env
vim .env # 各種環境変数を埋める
docker-compose build
docker-compose up
```

## Deploy

- [CircleCI](https://circleci.com)でデプロイ
- `.circleci/config.yml`参照

## License

[MIT](https://github.com/aiji42/transmission-project/blob/master/LICENSE)

