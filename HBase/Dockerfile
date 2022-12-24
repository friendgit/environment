FROM openjdk:8u342
MAINTAINER Peter Liang <defeng.liang.cn@gmail.com>

ENV HBASE_VERSION=0.98.7

RUN groupadd -r hbase && useradd -m -r -g hbase hbase

USER hbase
ENV HOME=/home/hbase

# Download'n extract hbase
RUN cd /home/hbase && \
    wget -O - -q https://archive.apache.org/dist/hbase/hbase-${HBASE_VERSION}/hbase-${HBASE_VERSION}-hadoop2-bin.tar.gz \
    | tar --strip-components=1 -zxf -

# Upload local configuration
ADD ./conf/ /home/hbase/conf/
USER root
RUN chown -R hbase:hbase /home/hbase/conf
USER hbase

# Prepare data volumes
RUN mkdir /home/hbase/data
RUN mkdir /home/hbase/logs

VOLUME /home/hbase/data
VOLUME /home/hbase/logs

# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

WORKDIR /home/hbase
CMD /home/hbase/bin/hbase master start
