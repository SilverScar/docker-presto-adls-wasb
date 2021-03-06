FROM dockerhub.ops.inmobi.com/production-engg/docker-jvm8-ubuntu-16.04:v2-20180619-7
MAINTAINER SequenceIQ

USER root

# install dev tools
RUN apt-get update
RUN apt-get install -y curl tar sudo openssh-server openssh-client rsync

# passwordless ssh
RUN rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

ENV JAVA_HOME /usr/java/default/
ENV PATH $PATH:$JAVA_HOME/bin

# download native support
RUN mkdir -p /tmp/native
RUN curl -L https://github.com/sequenceiq/docker-hadoop-build/releases/download/v2.7.1/hadoop-native-64-2.7.1.tgz | tar -xz -C /tmp/native

# hadoop
RUN curl -s https://archive.apache.org/dist/hadoop/core/hadoop-2.7.1/hadoop-2.7.1.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.7.1 hadoop

ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/java/default\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
#RUN . $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

RUN mkdir $HADOOP_PREFIX/input
RUN cp $HADOOP_PREFIX/etc/hadoop/*.xml $HADOOP_PREFIX/input

# pseudo distributed
ADD hadoop-files/core-site.xml.template $HADOOP_PREFIX/etc/hadoop/core-site.xml.template
RUN sed s/HOSTNAME/localhost/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
ADD hadoop-files/hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml

ADD hadoop-files/mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
ADD hadoop-files/yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

#Fixing Java path
RUN mkdir -p /usr/java/default/bin
RUN ln -s /usr/lib/jvm/java-8-oracle/jre/bin/java /usr/java/default/bin/java

RUN $HADOOP_PREFIX/bin/hdfs namenode -format

# fixing the libhadoop.so like a boss
RUN rm -rf /usr/local/hadoop/lib/native
RUN mv /tmp/native /usr/local/hadoop/lib

ADD hadoop-files/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

ADD hadoop-files/bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh

# workingaround docker.io build error
RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh
RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh

# fix the 254 error code
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "Port 2122" >> /etc/ssh/sshd_config

RUN service ssh start && $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && $HADOOP_PREFIX/sbin/start-dfs.sh && $HADOOP_PREFIX/bin/hdfs dfs -mkdir -p /user/root
RUN service ssh start && $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && $HADOOP_PREFIX/sbin/start-dfs.sh && $HADOOP_PREFIX/bin/hdfs dfs -put $HADOOP_PREFIX/etc/hadoop/ input

CMD ["/etc/bootstrap.sh", "-d"]

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122

#-----------------------------------------------------------------------------------------------------

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

## Uninstall JDK 1.7 that was installed in the base image
## Install JDK 1.8 since Azure Data Lake Store JARs are compiled using JDK 1.8
#RUN yum erase -y jdk
#
#ADD docker/jdk-8u181-linux-x64.rpm /tmp/
#
#RUN	cd /tmp && \
#	rpm -i jdk-8u181-linux-x64.rpm

EXPOSE 9083 8088 3306 8080

ADD docker/hadoop/hive-site.xml /tmp/
RUN cp /tmp/hive-site.xml $HIVE_HOME/conf/
#------------------------------------------------------------------------



RUN cd $TMPDIR && \
     curl -s -LO  http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.30/mysql-connector-java-5.1.30.jar && \
     mv $TMPDIR/mysql-connector-java-5.1.30.jar $TMPDIR/mysql-connector-java.jar && \
     cp $TMPDIR/mysql-connector-java.jar $HIVE_HOME/lib/

#RUN apt-get update
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server

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

#Update
RUN apt-get update && \
    apt-get install -y python uuid-runtime vim less

#RUN yum groupinstall -y "Development Tools"; yum clean all

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
RUN mkdir -p $PRESTO_DATA_DIR && \
    mkdir -p $PRESTO_DIR/etc/catalog && \
    mkdir -p $PRESTO_DIR/plugin/hive-hadoop2

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

#--------------------------------------------------------------------------------------------

#ADD docker/jdk-8u201-linux-x64.tar.gz /tmp/

#Lens Installation
ADD docker/lens-client_2.7.26-inm.deb /tmp/
ADD docker/lens-ext-lib_2.0.9.deb /tmp/
ADD docker/lens-internal_1.1.139.deb /tmp/
ADD docker/lens-server_2.7.26-inm.deb /tmp/
RUN cd $TMPDIR && \
#    wget https://artifactory-maven.corp.inmobi.com/artifactory/apt-repo/pool/trusty/lens-client_2.7.26-inm.deb && \
#    wget https://artifactory-maven.corp.inmobi.com/artifactory/apt-repo/pool/trusty/lens-ext-lib_2.0.9.deb && \
#    wget https://artifactory-maven.corp.inmobi.com/artifactory/apt-repo/pool/trusty/lens-internal_1.1.139.deb && \
#    wget https://artifactory-maven.corp.inmobi.com/artifactory/apt-repo/pool/trusty/lens-server_2.7.26-inm.deb && \
    dpkg -i /tmp/lens-client_2.7.26-inm.deb && \
    dpkg -i /tmp/lens-ext-lib_2.0.9.deb && \
    dpkg -i /tmp/lens-internal_1.1.139.deb && \
    dpkg -i /tmp/lens-server_2.7.26-inm.deb

RUN rm -rf /usr/local/lens/server/conf

ADD docker/lensServerConf /usr/local/lens/server/conf

ADD docker/lens-ctl /usr/local/lens/server/bin/

