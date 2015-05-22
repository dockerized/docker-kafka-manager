FROM xiocode/scala-sbt:latest

MAINTAINER Clement Laforet <sheepkiller@cultdeadsheep.org>

ENV ZK_HOSTS=localhost:2181 \
     KM_REVISION=a4495bf94b439b822039a2a6daa3194ee6fcbd7c \
     KM_VERSION=1.2.3

RUN cd / && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /kafka-manager && \
    git checkout ${KM_REVISION} && \
    sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${KM_VERSION}.zip

WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]
