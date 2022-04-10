# Dockerised cardanocli-rest
 https://github.com/Berry-Pool/cardanocli-rest

## Use-case
Provides http/REST interface for tools like:
- cardanocli-js - https://developers.cardano.org/docs/get-started/cardanocli-js/

## Dependencies
- docker
- cardano-cli

## Usage

```
git clone https://github.com/metaspan/cardanocli-rest-docker
cd cardanocli-rest-docker
docker build -t metaspan/cardanocli-rest .
docker run -it \
   --name cardanocli-rest \
   -e NETWORK=mainnet
   -e NODE_ENV=production
   -v /path/to/cardano:/var/cardano \
   -p 3000:3000 \
   metaspan/cardanocli-rest
```
Path to Cardano should contain `ipc/node.socket`

## Kudos
- Cardano !!
- https://github.com/Berry-Pool/cardanocli-rest
