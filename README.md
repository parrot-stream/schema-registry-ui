# schema-registry-ui

This is the fork project of a web tool for the [confluentinc/schema-registry](https://github.com/confluentinc/schema-registry) in order to create / view / search / evolve / view history & configure **Avro** schemas of your Kafka cluster.

## Prerequisites
You will need schema-registry installed with CORS enabled.

In order to enable CORS, add in `/opt/confluent-3.x.x/etc/schema-registry/schema-registry.properties`

```
access.control.allow.methods=GET,POST,PUT,OPTIONS
access.control.allow.origin=*
```
And then restart the [schema-registry] service

## Running it via docker

To run it via the provided docker image:

```
docker pull parrot-stream/schema-registry-ui
docker run --rm -p 8000:8000 \
           -e "SCHEMAREGISTRY_URL=http://confluent-schema-registry-host:port" \
           landoop/schema-registry-ui
```
## Running it via docker-compose

To run it via docker-compose:

```
docker-compose -f docker/docker-compose.yml up
```

It will be accessible with:

```
http://localhost:8000
```

## Build from source

```
    git clone https://github.com/parrot-stream/schema-registry-ui.git
    cd schema-registry-ui
    npm install
    npm start
```
Web UI will be available at `http://localhost:8080`

### Nginx config

If you use `nginx` to serve this ui, let angular manage routing with
```
    location / {
        try_files $uri $uri/ /index.html =404;
        root /folder-with-schema-registry-ui/;
    }
```

### Setup Schema Registry clusters

Use multiple schema registry clusters in `env.js` :
```
var clusters = [
   {
       NAME:"prod",
       // Schema Registry service URL (i.e. http://localhost:8081)
       SCHEMA_REGISTRY: "http://localhost:8081", // https://schema-registry.demo.landoop.com
       COLOR: "#141414" // optional
     },
     {
       NAME:"dev",
       SCHEMA_REGISTRY: "http://localhost:8383",
       COLOR: "red", // optional
       allowGlobalConfigChanges: true, // optional
       //allowTransitiveCompatibilities: true        // if using a Confluent Platform release >= 3.1.1 uncomment this line
     }
  ];

```
* Use `COLOR` to set different header colors for each set up cluster.
* Use `allowGlobalConfigChanges` to enable configuring Global Compatibility Level from the UI.
* Use `allowTransitiveCompatibilities` to enable transitive compatibility levels. This is supported in SR >= 3.1.1
* Use `allowSchemaDeletion` to enable schema deletion from the UI. This is supported in SR >= 3.3.0


## License

The project is licensed under the [BSL](http://www.landoop.com/bsl) license.

## Relevant Projects

* [Kafka Topics UI](https://github.com/parrot-stream/kafka-topics-ui), UI to browse Kafka data and work with Kafka Topics
* [Kafka Connect UI](https://github.com/parrot-stream/kafka-connect-ui), Set up and manage connectors for multiple connect clusters



# **kafka-topics-ui**
___

### Description
___

This image runs [**Kafka Topics UI**](https://github.com/Landoop/kafka-topics-ui.git).


You can pull it with:

    docker pull parrotstream/kafka-topics-ui


You can also find other images based on different Kafka Topics UI releases, using a different tag in the following form:

    docker pull parrotstream/kafka-topics-ui:[kafka-topics-ui-release]


Start with Docker Compose:

    docker-compose -p parrot -f docker.parrot/docker-compose.yml up


## Configuration

In the docker-compose.yml you can update the following environment variables:

  - `SCHEMAREGISTRY_URL`: the URL to point to the Schema Registry
  - `PROXY`: set to `true` the URL to point to Kafka Rest Proxy
  - `PORT`: the docker internal port to expose the Schema Registry UI. Remember to change the port mapping in the docker-compose.yml
  - `ALLOW_GLOBAL` [`true`|`false`]: set to `true` to enable global compatibility level change support
  - `ALLOW_TRANSITIVE` [`true`|`false`]: set to `true` to enable transitive compatibility modes support


Once started you'll be able to access to the following UI:

| **Schema Registry UI**      |**URL**                  |
|:----------------------------|:------------------------|
| *Schema Registry UI*        | http://localhost:8002    |


## Relevant Projects

* [Kafka Topics UI](https://github.com/parrot-stream/kafka-topics-ui), UI to browse Kafka data and work with Kafka Topics
* [Kafka Connect UI](https://github.com/parrot-stream/kafka-connect-ui), Set up and manage connectors for multiple connect clusters


## License

The project is licensed under the [BSL](http://www.landoop.com/bsl) license.


## Available tags:

- Kafka Connect UI 0.9.6 ([0.9.6](https://github.com/parrot-stream/kafka-connect-ui/blob/0.9.6/Dockerfile), [latest](https://github.com/parrot-stream/kafka-connect-ui/blob/latest/Dockerfile))
