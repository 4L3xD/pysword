#!/bin/bash
echo -e "\nInstalling custom tools..."
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
# go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
# go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest