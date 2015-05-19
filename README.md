# Docker image for building and running [Kafka Manager](https://github.com/yahoo/kafka-manager)

- Built on [baseimage-docker](http://phusion.github.io/baseimage-docker/)

To run, publish Kafka Manager's default web port ( 9000 ) and set ZK hosts for Kafka Manager's state. Note this is *not* the ZK connection for your kafka cluster's brokers!

    docker run -d \
    -p 9000:9000 \
    -e "ZK_HOSTS=zk1:2181,zk2:2181,zk3:2181/chroot/kafka-manager" \
    akursar/kafka-manager
