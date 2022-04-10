# Dockerised cardanocli-rest

`cardanocli-rest` is the REST interface to `cardanocli-js`

## Dependencies
- docker
- cardano-cli
- cardanocli-rest

## Usage

### Build

```
git clone https://github.com/metaspan/cardanocli-rest-docker
cd cardanocli-rest-docker
docker build -t metaspan/cardanocli-rest .
```

### Verify

```
docker run -it \
   --name cardanocli-rest \
   -e NETWORK=mainnet
   -e NODE_ENV=production
   -v /path/to/cardano:/var/cardano \
   -p 3000:3000 \
   metaspan/cardanocli-rest
```
Path to Cardano should contain `ipc/node.socket`

Open http://hostname:3000/api/v1/queryTip

### Debug mode

append ` npm run start:debug`
```
docker run -it \
   --name cardanocli-rest \
   -e NETWORK=mainnet
   -e NODE_ENV=production
   -v /path/to/cardano:/var/cardano \
   -p 3000:3000 \
   metaspan/cardanocli-rest npm run start:debug
```

### Run detached

```
docker run -d \
   --name cardanocli-rest \
   -e NETWORK=mainnet
   -e NODE_ENV=production
   -v /path/to/cardano:/var/cardano \
   -p 3000:3000 \
   metaspan/cardanocli-rest
```

## Kudos
- Cardano !!
- https://github.com/Berry-Pool/cardanocli-rest
- https://developers.cardano.org/docs/get-started/cardanocli-js/
- https://github.com/input-output-hk/cardano-js-sdk
