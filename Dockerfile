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

# Defina as variáveis de ambiente para o Go
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"

# Defina o diretório de trabalho
WORKDIR /app

# Copie arquivos do host para o contêiner (se necessário)
COPY . /app

# Comando padrão para rodar quando o contêiner iniciar
CMD ["bash"]