#!/bin/sh

# sleep 10
# echo "dir:${TR_TORRENT_DIR}" "name:${TR_TORRENT_NAME}" "id:${TR_TORRENT_ID}"
aws s3 mv /downloads/complete/ s3://${S3_BUCKET_NAME}/downloads/complete/ --recursive
rm -f "/config/resume/${TR_TORRENT_NAME}".*
rm -f "/config/torrents/${TR_TORRENT_NAME}".*

count=$((`ls -1 /config/resume/ | wc -l`+`ls -1 /config/torrents/ | wc -l`+`ls -1 /downloads/incomplete/ | wc -l`))

if [ ${STAGE} = 'production' ] && [ $count -eq 0 ]; then
  aws ecs update-service --service ${ECS_SERVICE_NAME} --cluster ${ECS_CLUSTER_NAME} --desired-count 0
  aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${AUTO_SCALING_GROUP_NAME} --min-size 0 --max-size 0 --desired-capacity 0
fi
