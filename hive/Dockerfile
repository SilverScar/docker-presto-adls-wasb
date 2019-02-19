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



RUN echo bind "set completion-ignore-case on"

RUN PS1='\[\e[0;33m\]\h:\W \u\$\[\e[m\] '


ENV refresh="source ~/.bash_profile"
ENV rf='source /home/lens/scripts/.bash_profile'
ENV profile="vi ~/.bash_profile"
ENV pf='vi /home/lens/scripts/.bash_profile'
ENV ll="ls -l"
ENV hn="hostname"
ENV scripts="cd /home/lens/scripts"


ENV hl="hadoop fs -ls"
ENV hc="hadoop fs -cat"
ENV hg="hadoop fs -get"
ENV hp="hadoop fs -put"
ENV hrm="hadoop fs -rm"
ENV hrmr="hadoop fs -rm -r -skipTrash"

ENV pigr="sudo -u reports pig -Dmapred.job.queue.name=reports"
ENV pigc="sudo -u cas pig -Dmapred.job.queue.name=pmatics"
ENV pigb="sudo -u brand pig -Dmapred.job.queue.name=brand"
ENV pigl="pig -x local"

ENV nobcat='/home/lens/scripts/nobcat.sh'
ENV cobcat='/home/lens/scripts/cobcat.sh'
ENV hduu="hadoop fs -du"
ENV hdu="hadoop fs -du -h"





ENV rep="/home/lens/scripts/rep.sh"
ENV rerun="/home/lens/scripts/rerun.sh"
ENV rrf="/home/lens/scripts/rerunFull.sh"
ENV rr="rerun"
ENV killer='/home/lens/scripts/killer.sh'
ENV url="/home/lens/scripts/historyUrl.sh"
ENV joburl="/home/lens/scripts/jobUrl.sh"
ENV coloUrl="/home/lens/scripts/coloUrl.sh"
ENV occ='/home/lens/scripts/occ.sh'
ENV uac='/home/lens/scripts/uac.sh'
ENV uacc='vi /home/lens/scripts/uac.sh'
ENV a='ENV'
ENV aa='/home/lens/scripts/aa.sh'
ENV aaa='/home/lens/scripts/aaa.sh'
ENV jobUrl='/home/lens/scripts/jobUrl.sh'

ENV sudocasput='hadoop fs -put'
ENV sch='cd /home/lens/scripts'
ENV ht='/home/lens/scripts/ht.sh'
ENV conc='/home/lens/scripts/conc.sh'
ENV allruns='/home/lens/scripts/allruns.sh'
ENV oji='/home/lens/scripts/oji.sh'

ENV LL='ll'
ENV PIG='pig'
ENV CD='cd'
ENV PWD='pwd'
ENV PF='pf'
ENV RF='rf'
ENV HL='hl'
ENV HC='hc'
ENV HT='ht'
ENV cobp='occ CAS-local-cbase-generator'
ENV COBP='cobp'
ENV cobpr='occ CAS-local-cbase-generator-regen'
ENV cobh='occ CAS-cbase-hourly-aggregate'
ENV cobho='occ cob-hourly-aggregate-process'
ENV cobd='occ COB-daily-aggregate-process'
ENV cobdr='occ COB-daily-rtbd-china-aggregate-process'
ENV cobm='occ COB-monthly-aggregate-process'
ENV cobb='occ CAS-RR-backup-process'
ENV creative='occ CAS-rtbd-adcontent-tar-generator'
ENV rmc='occ CAS-rmc-daily-generator'
ENV fc='occ brand-fcreporting'
ENV inv='occ brand-invsizing-fetcher'
ENV loader='occ brand-invsizing-loader'
ENV uu='occ brand-unique-users-report-loader'
ENV footfall='occ footfall-attribution'
ENV audience='occ brand-pds-attribute-generator-process'

ENV schf='hadoop fs'
ENV schfrm='hadoop fs -rm -r -skipTrash'
ENV IEPD='iepd'
ENV IEFD='iefd'
ENV HDU='hdu'
ENV NOBCAT='nobcat'
ENV COBCAT='cobcat'
ENV fq='hadoop fs -count -q /secure/projects/cas'
ENV hnp='/home/lens/scripts/hnp.sh'
ENV cobraw='hadoop fs -ls /projects/cas/cbase-aggregate-logs/'
ENV cobhour='hadoop fs -ls /projects/cas/cob-generation/cbase_hourly_aggregate/'
ENV cobday='hadoop fs -ls /projects/cas/cob-generation/cob_daily_aggregate/'
ENV cobmonth='hadoop fs -ls /projects/cas/cob-generation/cob_monthly_aggregate/'
ENV casp='/home/lens/scripts/casp.sh'
ENV pwdd='/home/lens/scripts/pwdd.sh'
ENV syn='/home/lens/scripts/sync.sh'
ENV push='/home/lens/scripts/push.sh'
ENV yl='/home/lens/scripts/yarnLogs.sh'
ENV yk='/home/lens/scripts/yarnKill.sh'
ENV scpp='/home/lens/scripts/scpp.sh'

ENV cas='export USER=cas'
ENV brand='export USER=brand;rf'
ENV user='echo $USER'
ENV USER='user'
ENV mp='export USER=merlin-perf'


ENV lr=/home/lens/scripts/lensrestart.sh
ENV tailc='tail -f /usr/local/lens/client/logs/lensclient.log'
ENV tails='tail -f /usr/local/lens/server/logs/lensserver.log'
ENV a='ENV'
ENV lens='/home/lens/scripts/lens/lens.sh'
ENV site='vi /usr/local/lens/server/conf/lens-site.xml'
ENV ctl='vi /usr/local/lens/server/bin/lens-ctl'
