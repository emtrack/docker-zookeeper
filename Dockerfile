FROM n3ziniuka5/ubuntu-oracle-jdk:14.04-JDK8u25
MAINTAINER Laurynas Tretjakovas "laurynas.tretjakovas@gmail.com"

RUN wget ftp://apache.mirror.vu.lt/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz && \
    tar xzf zookeeper-3.4.6.tar.gz && \
    mv zookeeper-3.4.6 /opt/zookeeper-3.4.6 && \
    ln -s /opt/zookeeper-3.4.6 /opt/zookeeper && \
    rm zookeeper-3.4.6.tar.gz && \
    cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

EXPOSE 2181

WORKDIR /opt/zookeeper
ENTRYPOINT ["./bin/zkServer.sh"]
CMD ["start-foreground"]
