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
    git \
    unzip \
    python3 \
    python3-pip \
    apt-utils \
    # Adicione outros pacotes que você precisa aqui
    && apt-get clean

# Instale o Go (Golang)
RUN wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz \
    && rm go1.22.4.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"

# Defina o diretório de trabalho
WORKDIR /app

# Copie arquivos do host para o contêiner (se necessário)
COPY . /app
RUN chmod +x ./app/octopus.sh
RUN ./app/octopus.sh

# Inicia o terminal interativo (TTY)
CMD ["/bin/bash"]