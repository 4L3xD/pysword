FROM kalilinux/kali-rolling:latest

LABEL maintainer="4L3xD"
LABEL website="https://github.com/4L3xD/pysword"
LABEL description="Red Team Tool for Penetration Testing"

# Atualize o repositório de pacotes e instale pacotes adicionais
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    # Adicione outros pacotes que você precisa aqui
    && apt-get clean

# Defina o diretório de trabalho
WORKDIR /app

# Copie arquivos do host para o contêiner (se necessário)
COPY . /app

# Comando padrão para rodar quando o contêiner iniciar
CMD ["bash"]