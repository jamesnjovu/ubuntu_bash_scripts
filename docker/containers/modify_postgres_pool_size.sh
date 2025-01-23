#! /bin/bash

sudo docker container ls

read -p "Enter the container name (default is postgres): " CONTAINER_NAME
CONTAINER_NAME=${CONTAINER_NAME:-'postgres'}

read -p "Enter the pool size (default is 500): " POOL_SIZE
POOL_SIZE=${POOL_SIZE:-'500'}

echo "Using $CONTAINER_NAME with pool size $POOL_SIZE"

sudo docker exec -it $CONTAINER_NAME psql -U postgres -c "ALTER SYSTEM SET max_connections = $POOL_SIZE;"

echo "Pool size updated successfully"

sudo docker exec -it $CONTAINER_NAME psql -U postgres -c "SHOW max_connections;"

sudo docker restart $CONTAINER_NAME

echo "Container restarted successfully"
