#!/bin/bash
echo "Pentesting based on OWASP-WSTG"
echo "1. Build a image and start a container"
echo "2. Start a container and attach it"
read -p "Type the correponding number: " choice
case $choice in
    1)
        echo -e "\nBuild a image and start a container"
        
        echo "Building Docker image..."
        docker build -t pysword .

        echo "Starting Docker image..."
        docker run -it --name wstg pysword   
        ;;
    2)
        echo -e "\nStart a container and attach it"
        docker start wstg
        docker attach wstg
        ;;
    *)
        echo -e "\nInvalid option. Please, select a valid option"
        ;;
esac