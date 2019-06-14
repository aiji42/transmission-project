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

```bash
sh ./transmission/scripts/push_ecr.sh
docker-compose run --rm serverless sls deploy -v -s prod 
```

※ この辺はCircleCIで自動化予定

## License

[MIT](https://github.com/aiji42/transmission-project/blob/master/LICENSE)

