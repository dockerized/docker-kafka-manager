FROM phusion/baseimage:0.9.16

RUN apt-get update && apt-get install -y \
  fakeroot \
  git \
  openjdk-7-jdk

ENV \
  KM_REVISION=a4495bf94b439b822039a2a6daa3194ee6fcbd7c \
  KM_VERSION=1.2.3

RUN cd / && \
  git clone https://github.com/yahoo/kafka-manager && \
  cd kafka-manager && \
  git checkout ${KM_REVISION} && \
  ./sbt clean clean debian:packageBin && \
  dpkg -i ./target/kafka-manager_${KM_VERSION}_all.deb && \
  rm -fr /kafka-manager

EXPOSE 9000

CMD ["/usr/bin/kafka-manager"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
