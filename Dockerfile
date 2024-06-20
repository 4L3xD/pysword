FROM kalilinux/kali-rolling:latest

LABEL maintainer="4L3xD"
LABEL website="https://github.com/4L3xD/pysword"
LABEL description="Red Team Tool for Penetration Testing"

# Atualize o repositório de pacotes e instale pacotes adicionais
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    build-essential \
    # Adicione outros pacotes que você precisa aqui
    && apt-get clean

# Instale o Go (Golang)
RUN wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz \
    && rm go1.22.4.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"

# Instalação de ferramentas de Pentest
# RUN go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
# RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
# RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# Defina o diretório de trabalho
WORKDIR /app

# Copie arquivos do host para o contêiner (se necessário)
COPY . /app

# Script de inicialização
# COPY octopus.sh /octopus.sh
# RUN chmod +x /octopus.sh
# RUN ./octopus.sh

# Inicia o terminal interativo (TTY)
CMD ["/bin/bash"]