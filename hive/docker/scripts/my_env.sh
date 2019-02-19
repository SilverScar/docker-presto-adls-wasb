ENV refresh="source ~/.bash_profile"
ENV rf='source /home/lens/scripts/.bash_profile'
ENV profile="vi ~/.bash_profile"
ENV pf='vi /home/lens/scripts/.bash_profile'
ENV ll="ls -l"
ENV hn="hostname"
ENV scripts="cd /home/lens/scripts"


export LC_CTYPE="en_US.UTF-8"
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
