FROM node:16

LABEL maintainer="derek@metaspan.com"
LABEL version="1.33.0"

ENV NETWORK=mainnet
ENV NODE_ENV=production

RUN apt update && \
    apt install -y git vim

RUN npm install pm2 -g

# cardano-node and cardano-cli binaries
RUN mkdir /opt/cardano
WORKDIR /opt/cardano
RUN wget https://hydra.iohk.io/build/13648290/download/1/cardano-node-1.33.0-linux.tar.gz
RUN tar -xf cardano-node-1.33.0-linux.tar.gz
RUN echo "export PATH=/opt/cardano:${PATH}" >> /root/.bashrc

# node|npm needs this in order to find cardano-cli
ENV PATH=/opt/cardano:$PATH

# cardanocli-rest
RUN cd /opt && git clone https://github.com/Berry-Pool/cardanocli-rest
WORKDIR /opt/cardanocli-rest
RUN npm install
# config.yaml points to /opt/cardano/configuration/cardano/mainnet-shelley-genesis.json
COPY config.yaml config.yaml
# COPY .env.dist .env
RUN echo "NODE_ENV=${NODE_ENV}}" > .env
RUN echo "PORT=3000" >> .env

# PORT
EXPOSE 3000

# mount this to your cardano-node
VOLUME [ "/var/cardano" ]

# Util alias
RUN echo "alias ll='ls -l'" >> /root/.bashrc

CMD [ "/usr/local/bin/npm", "run", "start" ]
# CMD [ "/bin/bash" ]
