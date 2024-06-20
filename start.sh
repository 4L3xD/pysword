#!/bin/bash

echo -e "PENTEST MODE:\n"
echo "1. External"
echo -e "2. Internal\n"
read -p "Type the correponding number: " mode

case $mode in
    1)
        echo "External Pentesting"
        echo "1. Build a image and start a container"
        echo "2. Start a container and attach it"
        read -p "Type the correponding number: " choice
        case $choice in
            1)
                echo "Build a image and start a container"
                
                echo -e "Building Docker image..."
                docker build -f External -t pysword .
    
                echo -e "Starting Docker image..."
                docker run -it --name external pysword   
                ;;
            2)
                echo "Start a container and attach it"
                docker start external
                docker attach external
                ;;
            *)
                echo "Invalid option. Please, select a valid option"
                ;;
        esac
        ;;
    2)
        echo "Internal Pentesting"
        ;;
    *)
        echo "Invalid option. Please, select a valid option"
        ;;
esac