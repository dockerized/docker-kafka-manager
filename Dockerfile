FROM xiocode/scala-sbt:latest

MAINTAINER Tony Shao <xiocode@gmail.com>

ENV ZK_HOSTS=localhost:2181 \
     KM_REVISION=1b45af100ee302dfe53f31a9c7a041999fe3d83a \
     KM_VERSION=1.3.0.4

RUN cd / && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /kafka-manager && \
    git checkout ${KM_REVISION} && \
    sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${KM_VERSION}.zip

WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]
