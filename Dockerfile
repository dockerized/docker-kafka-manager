FROM xiocode/scala-sbt:latest

MAINTAINER Tony Shao <xiocode@gmail.com>

ENV ZK_HOSTS=localhost:2181 \
     KM_REVISION=44926597301f6052d2b3e302de643d2b4817c95f \
     KM_VERSION=1.2.9.10

RUN cd / && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /kafka-manager && \
    git checkout ${KM_REVISION} && \
    sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${KM_VERSION}.zip

WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]
