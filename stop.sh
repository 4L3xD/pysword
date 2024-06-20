#!/bin/bash

docker ps -la
echo -e "Exit mode:\n"
echo "1. Stop all containers"
echo -e "2. Stop and remove all containers\n"
read -p "Type the correponding number: " choice

case $choice in
    1)
        echo "Stopping all running containers..."
        docker stop $(docker ps -q)

        echo "All containers have been stopped and removed."
        docker ps -la
        ;;
    2)
        echo "Stopping all running containers..."
        docker stop $(docker ps -q)

        echo "Removing all containers..."
        docker rm $(docker ps -a -q)

        echo "All containers have been stopped and removed."
        docker ps -la
        ;;
    *)
        echo "Invalid option. Please, select a valid option"
        ;;
esac
