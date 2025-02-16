FROM debian:latest

WORKDIR /

EXPOSE 3000


RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install nodejs -y

RUN git clone https://github.com/Voy7/SlopToob.git 

ARG user=slop
RUN useradd --create-home $user \
    && usermod -aG sudo $user

COPY start.sh /SlopToob/start.sh

RUN chown -R $user:$user /SlopToob

USER $user
WORKDIR /SlopToob

RUN touch .env 

CMD ["/bin/sh", "/SlopToob/start.sh"]