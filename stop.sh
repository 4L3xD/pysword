#!/bin/bash
docker ps -la
echo -e "Exit mode:\n"
echo "1. Stop container"
echo -e "2. Stop and remove container\n"
read -p "Type the correponding number: " choice

case $choice in
    1)
        echo "Stopping running container..."
        docker stop wstg
        echo "The container has been stopped."
        docker ps -la
        ;;
    2)
        echo "Stopping running container..."
        docker stop wstg

        echo "Removing all containers..."
        docker rm wstg

        echo "The container has been stopped and removed."
        docker ps -la
        ;;
    *)
        echo "Invalid option. Please, select a valid option. Execute the script again."
        ;;
esac