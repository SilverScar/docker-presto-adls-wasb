FROM sequenceiq/hadoop-docker:2.7.0

ENV HIVE_VERSION=2.1.0
ENV HIVE_HOME=/usr/local/hive
ENV PATH=$HIVE_HOME/bin:$PATH
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin

ENV TMPDIR /tmp



ADD docker/scripts /home/lens/scripts
#ADD docker/.bash_profile /

RUN chmod +x /home/lens/scripts/my_env.sh && sleep 1
RUN /home/lens/scripts/my_env.sh


ADD docker/hadoop/hadoop-env.sh /tmp/
ADD docker/hadoop/core-site.xml /tmp/

RUN cp /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/
RUN cp /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/

RUN cd $HADOOP_HOME/share/hadoop/tools/lib && \
	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/2.0.0/azure-storage-2.0.0.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar && \
	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.1.5/azure-data-lake-store-sdk-2.1.5.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.0.0-alpha3/hadoop-azure-datalake-3.0.0-alpha3.jar

# Download hive
RUN curl -s -O https://archive.apache.org/dist/hive/hive-2.1.0/apache-hive-2.1.0-bin.tar.gz && \
	tar -zxf ./apache-hive-${HIVE_VERSION}-bin.tar.gz && \
	mv ./apache-hive-${HIVE_VERSION}-bin $HIVE_HOME && \
	rm -f ./apache-hive-${HIVE_VERSION}-bin.tar.gz

# Download specific jars needed for ADLS and WASB and not included in Hive
RUN cd $HIVE_HOME/lib && \
	curl -O http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.6.0/jackson-core-2.6.0.jar && \
	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/2.0.0/azure-storage-2.0.0.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar && \
	curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.1.5/azure-data-lake-store-sdk-2.1.5.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.0.0-alpha3/hadoop-azure-datalake-3.0.0-alpha3.jar

# Uninstall JDK 1.7 that was installed in the base image
# Install JDK 1.8 since Azure Data Lake Store JARs are compiled using JDK 1.8
RUN yum erase -y jdk

RUN cp docker/jdk-8u181-linux-x64.rpm /tmp/ && \
	cd /tmp && \
	rpm -i jdk-8u131-linux-x64.rpm && \
	rm jdk-8u131-linux-x64.rpm

EXPOSE 9083 8088 3306 8080

ADD docker/hadoop/hive-site.xml /tmp/
RUN cp /tmp/hive-site.xml $HIVE_HOME/conf/
#------------------------------------------------------------------------



RUN cd $TMPDIR && \
     curl -s -LO  http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.30/mysql-connector-java-5.1.30.jar && \
     mv $TMPDIR/mysql-connector-java-5.1.30.jar $TMPDIR/mysql-connector-java.jar && \
     cp $TMPDIR/mysql-connector-java.jar $HIVE_HOME/lib/

ADD docker/mysql_startup.sh ${TMPDIR}/mysql_startup.sh
RUN chmod +x ${TMPDIR}/mysql_startup.sh


ENV TMPDIR=/tmp

#------------------------------------------------------------------------------------


ADD files/metastore-start.sh /etc/metastore-start.sh
RUN chmod +x /etc/metastore-start.sh && sleep 1

#CMD /etc/metastore-start.sh

#--------------------------------------------------------------------------------------

# Environment variables
ENV PRESTO_VERSION 0.215
ENV OPT_DIR /opt
ENV PRESTO_DIR /opt/presto
ENV PRESTO_DATA_DIR /opt/presto/data

# Update
#RUN apt-get update && \
#    apt-get install -y python uuid-runtime vim less

RUN yum groupinstall -y "Development Tools"; yum clean all

# Download Presto
RUN mkdir -p $OPT_DIR && \
    cd $OPT_DIR && \
    curl -LO http://repo1.maven.org/maven2/com/facebook/presto/presto-server/$PRESTO_VERSION/presto-server-$PRESTO_VERSION.tar.gz && \
    tar xvf presto-server-$PRESTO_VERSION.tar.gz && \
    mv presto-server-$PRESTO_VERSION presto && \
    rm presto-server-$PRESTO_VERSION.tar.gz

# Download Presto CLI
RUN cd $PRESTO_DIR && \
    curl -O http://repo1.maven.org/maven2/com/facebook/presto/presto-cli/$PRESTO_VERSION/presto-cli-$PRESTO_VERSION-executable.jar && \
    mv presto-cli-$PRESTO_VERSION-executable.jar presto && \
    chmod +x presto

# Create directories
RUN mkdir -p $PRESTO_DATA_DIR
    # && \
    # mkdir -p $PRESTO_DIR/etc/catalog && \
    # mkdir -p $PRESTO_DIR/plugin/hive-hadoop2

# Download specific jars needed for ADLS and WASB and not included in Presto
# hadoop-azure-2.7.3.jar depends on azure-storage-2.0.0.jar since it implements the startCopyFromBlob which was removed from later versions
RUN cd $PRESTO_DIR/plugin/hive-hadoop2 && \
    curl -O http://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar && \
    curl -O http://repo1.maven.org/maven2/org/mortbay/jetty/jetty-util/6.1.26/jetty-util-6.1.26.jar && \
    curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/2.0.0/azure-storage-2.0.0.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar && \
    curl -O http://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.1.5/azure-data-lake-store-sdk-2.1.5.jar && \
    curl -O http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.0.0-alpha3/hadoop-azure-datalake-3.0.0-alpha3.jar

ADD files /_build/

RUN chmod +x /_build/create-configs.sh && sleep 1 && \
    /_build/create-configs.sh && \
    mv /_build/adls-wasb-site.xml $PRESTO_DIR/etc/catalog/ && \
    mv /_build/presto-start.sh /etc/presto-start.sh && \
    chmod +x /etc/presto-start.sh && sleep 1 && \
    mv /_build/motd.txt /etc/motd && \
    rm -rf /_build

RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc

WORKDIR $PRESTO_DIR

CMD /etc/presto-start.sh







