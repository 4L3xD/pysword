#!/bin/bash

docker ps -la
echo "Stopping all running containers..."
docker stop $(docker ps -q)

echo "Removing all containers..."
docker rm $(docker ps -a -q)

echo "All containers have been stopped and removed."
docker ps -la