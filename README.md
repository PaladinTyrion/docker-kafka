[![Docker Stars](https://img.shields.io/docker/stars/digitalwonderland/kafka.svg)](https://hub.docker.com/r/paladintyrion/kafka_2.12-0.11.0.0/) [![Docker Pulls](https://img.shields.io/docker/pulls/digitalwonderland/kafka.svg)](https://hub.docker.com/r/paladintyrion/kafka_2.12-0.11.0.0//) [![](https://images.microbadger.com/badges/image/digitalwonderland/kafka.svg)](https://hub.docker.com/r/paladintyrion/kafka_2.12-0.11.0.0/)

# About:

[Docker](http://www.docker.com/) image based on [openjdk:8-jre-alpine](https://github.com/docker-library/openjdk/blob/master/8-jre/alpine/Dockerfile)

# Additional Software:

* [Apache Kafka](http://kafka.apache.org/)

# Usage:

The image provides a clusterable Kafka broker.

As a minimum the following environment variables must be set:

1. ```KAFKA_BROKER_ID```
2. ```KAFKA_LISTENERS```
3. ```KAFKA_ZOOKEEPER_CONNECT```

So, assuming your Docker host is ```10.199.145.25```, has [Zookeeper](http://zookeeper.apache.org/) running and should now run Kafka as well, execute the following:

```
docker run -d -e KAFKA_BROKER_ID=1 -e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 -e KAFKA_ZOOKEEPER_CONNECT=zk_ip1:2181,zk_ip2:2181,zk_ip3:2181 paladintyrion/kafka_2.12-0.11.0.0
```

(if you are looking for a clusterable Zookeeper Docker image, feel free to use [digitalwonderland/zookeeper](https://github.com/digital-wonderland/docker-zookeeper))

### Additional Configuration

Configuration parameters can be provided via environment variables starting with ```KAFKA_```. Any matching variable will be added to Kafkas ```server.properties``` by

1. removing the ```KAFKA_``` prefix
2. transformation to lower case
3. replacing any occurences of ```_``` with ```.```

For example an environment variable ```KAFKA_NUM_PARTITIONS=3``` will result in ```num.partitions=3``` within ```server.properties```.

### Evaluated Parameters

Any environment variable starting with ```KAFKA_``` and ending with ```_COMMAND``` will be first evaluated and the result saved in an environment variable without the trailing ```_COMMAND```.

For example an environment variable ```KAFKA_ADVERTISED_HOST_NAME_COMMAND=hostname``` will export ```KAFKA_ADVERTISED_HOST_NAME``` with the value obtained by running ```hostname``` command inside the container.
