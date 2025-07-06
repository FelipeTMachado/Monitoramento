#!/bin/bash

set -o allexport
source .env
set +o allexport

docker compose down
sudo rm -r ./data/mongodb ./data/mysql

docker compose up -d --build

sleep 10

#docker exec -it mysql_heimdall mysql -u heimdall --password=$MYSQL_PASSWORD