FROM sequenceiq/hadoop-docker:2.7.0

FROM openjdk:8

ENV HIVE_VERSION=2.3.4
ENV HIVE_HOME=/usr/local/hive
ENV PATH=$HIVE_HOME/bin:$PATH

RUN apt-get update && \
    apt-get install -y netcat

ADD docker/scripts /home/lens/scripts
ADD docker/.bash_profile /
RUN chmod +x /home/lens/scripts/my_env.sh


# Download hive
RUN curl -s -O http://apache.claz.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
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
#RUN yum erase -y jdk && \
#	curl -s -LO 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
#	rpm -i jdk-8u131-linux-x64.rpm && \
#	rm jdk-8u131-linux-x64.rpm

EXPOSE 9083

ADD files/metastore-start.sh /etc/metastore-start.sh
RUN chmod +x /etc/metastore-start.sh && sleep 1

CMD /etc/metastore-start.sh



RUN echo 'bind \"set completion-ignore-case on\"'

RUN PS1='\[\e[0;33m\]\h:\W \u\$\[\e[m\] '


-----------------------------------------------------------
RUN echo 'alias refresh="source ~/.bash_profile"' >> ~/.bashrc
RUN echo 'alias rf="source /home/lens/scripts/.bash_profile"' >> ~/.bashrc
RUN echo 'alias profile="vi ~/.bash_profile"' >> ~/.bashrc
RUN echo 'alias pf="vi /home/lens/scripts/.bash_profile"' >> ~/.bashrc
RUN echo 'alias ll="ls -l"' >> ~/.bashrc
RUN echo 'alias hn="hostname"' >> ~/.bashrc
RUN echo 'alias scripts="cd /home/lens/scripts"' >> ~/.bashrc
RUN echo 'alias hl="hadoop fs -ls"' >> ~/.bashrc
RUN echo 'alias hc="hadoop fs -cat"' >> ~/.bashrc
RUN echo 'alias hg="hadoop fs -get"' >> ~/.bashrc
RUN echo 'alias hp="hadoop fs -put"' >> ~/.bashrc
RUN echo 'alias hrm="hadoop fs -rm"' >> ~/.bashrc
RUN echo 'alias hrmr="hadoop fs -rm -r -skipTrash"' >> ~/.bashrc
RUN echo 'alias pigr="sudo -u reports pig -Dmapred.job.queue.name=reports"' >> ~/.bashrc
RUN echo 'alias pigc="sudo -u cas pig -Dmapred.job.queue.name=pmatics"' >> ~/.bashrc
RUN echo 'alias pigb="sudo -u brand pig -Dmapred.job.queue.name=brand"' >> ~/.bashrc
RUN echo 'alias pigl="pig -x local"' >> ~/.bashrc
RUN echo 'alias nobcat="/home/lens/scripts/nobcat.sh"' >> ~/.bashrc
RUN echo 'alias cobcat="/home/lens/scripts/cobcat.sh"' >> ~/.bashrc
RUN echo 'alias hduu="hadoop fs -du"' >> ~/.bashrc
RUN echo 'alias hdu="hadoop fs -du -h"' >> ~/.bashrc
RUN echo 'alias rep="/home/lens/scripts/rep.sh"' >> ~/.bashrc
RUN echo 'alias rerun="/home/lens/scripts/rerun.sh"' >> ~/.bashrc
RUN echo 'alias rrf="/home/lens/scripts/rerunFull.sh"' >> ~/.bashrc
RUN echo 'alias rr="rerun"' >> ~/.bashrc
RUN echo 'alias killer="/home/lens/scripts/killer.sh"' >> ~/.bashrc
RUN echo 'alias url="/home/lens/scripts/historyUrl.sh"' >> ~/.bashrc
RUN echo 'alias joburl="/home/lens/scripts/jobUrl.sh"' >> ~/.bashrc
RUN echo 'alias coloUrl="/home/lens/scripts/coloUrl.sh"' >> ~/.bashrc
RUN echo 'alias occ="/home/lens/scripts/occ.sh"' >> ~/.bashrc
RUN echo 'alias uac="/home/lens/scripts/uac.sh"' >> ~/.bashrc
RUN echo 'alias uacc="vi /home/lens/scripts/uac.sh"' >> ~/.bashrc
RUN echo 'alias a="ENV"' >> ~/.bashrc
RUN echo 'alias aa="/home/lens/scripts/aa.sh"' >> ~/.bashrc
RUN echo 'alias aaa="/home/lens/scripts/aaa.sh"' >> ~/.bashrc
RUN echo 'alias jobUrl="/home/lens/scripts/jobUrl.sh"' >> ~/.bashrc
RUN echo 'alias sudocasput="hadoop fs -put"' >> ~/.bashrc
RUN echo 'alias sch="cd /home/lens/scripts"' >> ~/.bashrc
RUN echo 'alias ht="/home/lens/scripts/ht.sh"' >> ~/.bashrc
RUN echo 'alias conc="/home/lens/scripts/conc.sh"' >> ~/.bashrc
RUN echo 'alias allruns="/home/lens/scripts/allruns.sh"' >> ~/.bashrc
RUN echo 'alias oji="/home/lens/scripts/oji.sh"' >> ~/.bashrc
RUN echo 'alias LL="ll"' >> ~/.bashrc
RUN echo 'alias PIG="pig"' >> ~/.bashrc
RUN echo 'alias CD="cd"' >> ~/.bashrc
RUN echo 'alias PWD="pwd"' >> ~/.bashrc
RUN echo 'alias PF="pf"' >> ~/.bashrc
RUN echo 'alias RF="rf"' >> ~/.bashrc
RUN echo 'alias HL="hl"' >> ~/.bashrc
RUN echo 'alias HC="hc"' >> ~/.bashrc
RUN echo 'alias HT="ht"' >> ~/.bashrc
RUN echo 'alias cobp="occ CAS-local-cbase-generator"' >> ~/.bashrc
RUN echo 'alias COBP="cobp"' >> ~/.bashrc
RUN echo 'alias cobpr="occ CAS-local-cbase-generator-regen"' >> ~/.bashrc
RUN echo 'alias cobh="occ CAS-cbase-hourly-aggregate"' >> ~/.bashrc
RUN echo 'alias cobho="occ cob-hourly-aggregate-process"' >> ~/.bashrc
RUN echo 'alias cobd="occ COB-daily-aggregate-process"' >> ~/.bashrc
RUN echo 'alias cobdr="occ COB-daily-rtbd-china-aggregate-process"' >> ~/.bashrc
RUN echo 'alias cobm="occ COB-monthly-aggregate-process"' >> ~/.bashrc
RUN echo 'alias cobb="occ CAS-RR-backup-process"' >> ~/.bashrc
RUN echo 'alias creative="occ CAS-rtbd-adcontent-tar-generator"' >> ~/.bashrc
RUN echo 'alias rmc="occ CAS-rmc-daily-generator"' >> ~/.bashrc
RUN echo 'alias fc="occ brand-fcreporting"' >> ~/.bashrc
RUN echo 'alias inv="occ brand-invsizing-fetcher"' >> ~/.bashrc
RUN echo 'alias loader="occ brand-invsizing-loader"' >> ~/.bashrc
RUN echo 'alias uu="occ brand-unique-users-report-loader"' >> ~/.bashrc
RUN echo 'alias footfall="occ footfall-attribution"' >> ~/.bashrc
RUN echo 'alias audience="occ brand-pds-attribute-generator-process"' >> ~/.bashrc
RUN echo 'alias schf="hadoop fs"' >> ~/.bashrc
RUN echo 'alias schfrm="hadoop fs -rm -r -skipTrash"' >> ~/.bashrc
RUN echo 'alias IEPD="iepd"' >> ~/.bashrc
RUN echo 'alias IEFD="iefd"' >> ~/.bashrc
RUN echo 'alias HDU="hdu"' >> ~/.bashrc
RUN echo 'alias NOBCAT="nobcat"' >> ~/.bashrc
RUN echo 'alias COBCAT="cobcat"' >> ~/.bashrc
RUN echo 'alias fq="hadoop fs -count -q /secure/projects/cas"' >> ~/.bashrc
RUN echo 'alias hnp="/home/lens/scripts/hnp.sh"' >> ~/.bashrc
RUN echo 'alias cobraw="hadoop fs -ls /projects/cas/cbase-aggregate-logs/"' >> ~/.bashrc
RUN echo 'alias cobhour="hadoop fs -ls /projects/cas/cob-generation/cbase_hourly_aggregate/"' >> ~/.bashrc
RUN echo 'alias cobday="hadoop fs -ls /projects/cas/cob-generation/cob_daily_aggregate/"' >> ~/.bashrc
RUN echo 'alias cobmonth="hadoop fs -ls /projects/cas/cob-generation/cob_monthly_aggregate/"' >> ~/.bashrc
RUN echo 'alias casp="/home/lens/scripts/casp.sh"' >> ~/.bashrc
RUN echo 'alias pwdd="/home/lens/scripts/pwdd.sh"' >> ~/.bashrc
RUN echo 'alias syn="/home/lens/scripts/sync.sh"' >> ~/.bashrc
RUN echo 'alias push="/home/lens/scripts/push.sh"' >> ~/.bashrc
RUN echo 'alias yl="/home/lens/scripts/yarnLogs.sh"' >> ~/.bashrc
RUN echo 'alias yk="/home/lens/scripts/yarnKill.sh"' >> ~/.bashrc
RUN echo 'alias scpp="/home/lens/scripts/scpp.sh"' >> ~/.bashrc
RUN echo 'alias cas="export USER=cas"' >> ~/.bashrc
RUN echo 'alias brand="export USER=brand;rf"' >> ~/.bashrc
RUN echo 'alias user="echo $USER"' >> ~/.bashrc
RUN echo 'alias USER="user"' >> ~/.bashrc
RUN echo 'alias mp="export USER=merlin-perf"' >> ~/.bashrc
RUN echo 'alias lr=/home/lens/scripts/lensrestart.sh' >> ~/.bashrc
RUN echo 'alias tailc="tail -f /usr/local/lens/client/logs/lensclient.log"' >> ~/.bashrc
RUN echo 'alias tails="tail -f /usr/local/lens/server/logs/lensserver.log"' >> ~/.bashrc
RUN echo 'alias a="alias"' >> ~/.bashrc
RUN echo 'alias lens="/home/lens/scripts/lens/lens.sh"' >> ~/.bashrc
RUN echo 'alias site="vi /usr/local/lens/server/conf/lens-site.xml"' >> ~/.bashrc
RUN echo 'alias ctl="vi /usr/local/lens/server/bin/lens-ctl"' >> ~/.bashrc