import json
import os
from boto3.session import Session

def uploadedTorrentFile(event, context):
    session = Session(
      aws_access_key_id=os.environ['ACCESS_TOKEN'],
      aws_secret_access_key=os.environ['ACCESS_TOKEN_SECRET'],
      region_name=os.environ['DEFAULT_REGION']
    )
    ecs = session.client('ecs')
    autoscaling = session.client('autoscaling')

    ecs.update_service(
      cluster=os.environ['ECS_CLUSTER_NAME'],
      service=os.environ['ECS_SERVICE_NAME'],
      desiredCount=1
    )

    autoscaling.update_auto_scaling_group(
      AutoScalingGroupName=os.environ['AUTO_SCALING_GROUP_NAME'],
      DesiredCapacity=1,
      MinSize=0,
      MaxSize=1,
    )

    response = {
        "statusCode": 200,
        "body": "ECS Service UP"
    }

    return response
