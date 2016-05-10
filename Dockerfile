FROM xiocode/scala-sbt:latest

MAINTAINER Tony Shao <xiocode@gmail.com>

ENV ZK_HOSTS=localhost:2181 \
     KM_VERSION=1.3.0.8

RUN cd / && \
    curl -OL https://github.com/yahoo/kafka-manager/archive/${KM_VERSION}.zip && \
    unzip -d /tmp ${KM_VERSION}.zip && \
    cd /tmp/kafka-manager-${KM_VERSION} && \
    sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${KM_VERSION}.zip

WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]
