#!/bin/bash

HOST=yoursubdomain.yourcompany.com
KEY=<yourco<company>
IMAGE_NAME=<your_docker_image_name>

ssh -i ~/.ssh/${KEY}.pem ubuntu@${HOST} <<'ENDSSH'
  set +e
  IMAGE_NAME=935614717044.dkr.ecr.sa-east-1.amazonaws.com/confraria-api-timeline
  CONTAINER_PORT=8080
  HOST_PORT=8080
  docker pull ${IMAGE_NAME}:latest
  docker rm $(docker stop $(docker ps -a -q --filter ancestor=${IMAGE_NAME} --format="{{.ID}}"))
  docker run -d -p ${CONTAINER_PORT}:${HOST_PORT} ${IMAGE_NAME}
ENDSSH
