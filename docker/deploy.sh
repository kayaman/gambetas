#!/bin/bash

HOST=dock.yourcompany.com
KEY=yourcompany

ssh -i ~/.ssh/$KEY.pem ubuntu@$HOST <<'ENDSSH'
  set +e
  # ---
  export IMAGE_NAME=<yourdockerimagename>
  export CONTAINER_PORT=8080
  export HOST_PORT=8080
  # ---
  docker pull $IMAGE_NAME:latest
  docker rm $(docker stop $(docker ps -a -q --filter ancestor=$IMAGE_NAME --format="{{.ID}}"))
  docker run -d -p $CONTAINER_PORT:$HOST_PORT $IMAGE_NAME
ENDSSH
