echo 'PS1="\[\e[0;33m\]\h:\W \u\$\[\e[m\] "' >> ~/.bashrc
echo 'bind "set completion-ignore-case on"' >> ~/.bashrc
echo 'alias refresh="source ~/.bash_profile"' >> ~/.bashrc
echo 'alias rf="source /home/lens/scripts/.bash_profile"' >> ~/.bashrc
echo 'alias profile="vi ~/.bash_profile"' >> ~/.bashrc
echo 'alias pf="vi /home/lens/scripts/.bash_profile"' >> ~/.bashrc
echo 'alias ll="ls -l"' >> ~/.bashrc
echo 'alias hn="hostname"' >> ~/.bashrc
echo 'alias scripts="cd /home/lens/scripts"' >> ~/.bashrc
echo 'alias hl="hadoop fs -ls"' >> ~/.bashrc
echo 'alias hc="hadoop fs -cat"' >> ~/.bashrc
echo 'alias hg="hadoop fs -get"' >> ~/.bashrc
echo 'alias hp="hadoop fs -put"' >> ~/.bashrc
echo 'alias hrm="hadoop fs -rm"' >> ~/.bashrc
echo 'alias hrmr="hadoop fs -rm -r -skipTrash"' >> ~/.bashrc
echo 'alias pigr="sudo -u reports pig -Dmapred.job.queue.name=reports"' >> ~/.bashrc
echo 'alias pigc="sudo -u cas pig -Dmapred.job.queue.name=pmatics"' >> ~/.bashrc
echo 'alias pigb="sudo -u brand pig -Dmapred.job.queue.name=brand"' >> ~/.bashrc
echo 'alias pigl="pig -x local"' >> ~/.bashrc
echo 'alias nobcat="/home/lens/scripts/nobcat.sh"' >> ~/.bashrc
echo 'alias cobcat="/home/lens/scripts/cobcat.sh"' >> ~/.bashrc
echo 'alias hduu="hadoop fs -du"' >> ~/.bashrc
echo 'alias hdu="hadoop fs -du -h"' >> ~/.bashrc
echo 'alias rep="/home/lens/scripts/rep.sh"' >> ~/.bashrc
echo 'alias rerun="/home/lens/scripts/rerun.sh"' >> ~/.bashrc
echo 'alias rrf="/home/lens/scripts/rerunFull.sh"' >> ~/.bashrc
echo 'alias rr="rerun"' >> ~/.bashrc
echo 'alias killer="/home/lens/scripts/killer.sh"' >> ~/.bashrc
echo 'alias url="/home/lens/scripts/historyUrl.sh"' >> ~/.bashrc
echo 'alias joburl="/home/lens/scripts/jobUrl.sh"' >> ~/.bashrc
echo 'alias coloUrl="/home/lens/scripts/coloUrl.sh"' >> ~/.bashrc
echo 'alias occ="/home/lens/scripts/occ.sh"' >> ~/.bashrc
echo 'alias uac="/home/lens/scripts/uac.sh"' >> ~/.bashrc
echo 'alias uacc="vi /home/lens/scripts/uac.sh"' >> ~/.bashrc
echo 'alias a="ENV"' >> ~/.bashrc
echo 'alias aa="/home/lens/scripts/aa.sh"' >> ~/.bashrc
echo 'alias aaa="/home/lens/scripts/aaa.sh"' >> ~/.bashrc
echo 'alias jobUrl="/home/lens/scripts/jobUrl.sh"' >> ~/.bashrc
echo 'alias sudocasput="hadoop fs -put"' >> ~/.bashrc
echo 'alias sch="cd /home/lens/scripts"' >> ~/.bashrc
echo 'alias ht="/home/lens/scripts/ht.sh"' >> ~/.bashrc
echo 'alias conc="/home/lens/scripts/conc.sh"' >> ~/.bashrc
echo 'alias allruns="/home/lens/scripts/allruns.sh"' >> ~/.bashrc
echo 'alias oji="/home/lens/scripts/oji.sh"' >> ~/.bashrc
echo 'alias LL="ll"' >> ~/.bashrc
echo 'alias PIG="pig"' >> ~/.bashrc
echo 'alias CD="cd"' >> ~/.bashrc
echo 'alias PWD="pwd"' >> ~/.bashrc
echo 'alias PF="pf"' >> ~/.bashrc
echo 'alias RF="rf"' >> ~/.bashrc
echo 'alias HL="hl"' >> ~/.bashrc
echo 'alias HC="hc"' >> ~/.bashrc
echo 'alias HT="ht"' >> ~/.bashrc
echo 'alias cobp="occ CAS-local-cbase-generator"' >> ~/.bashrc
echo 'alias COBP="cobp"' >> ~/.bashrc
echo 'alias cobpr="occ CAS-local-cbase-generator-regen"' >> ~/.bashrc
echo 'alias cobh="occ CAS-cbase-hourly-aggregate"' >> ~/.bashrc
echo 'alias cobho="occ cob-hourly-aggregate-process"' >> ~/.bashrc
echo 'alias cobd="occ COB-daily-aggregate-process"' >> ~/.bashrc
echo 'alias cobdr="occ COB-daily-rtbd-china-aggregate-process"' >> ~/.bashrc
echo 'alias cobm="occ COB-monthly-aggregate-process"' >> ~/.bashrc
echo 'alias cobb="occ CAS-RR-backup-process"' >> ~/.bashrc
echo 'alias creative="occ CAS-rtbd-adcontent-tar-generator"' >> ~/.bashrc
echo 'alias rmc="occ CAS-rmc-daily-generator"' >> ~/.bashrc
echo 'alias fc="occ brand-fcreporting"' >> ~/.bashrc
echo 'alias inv="occ brand-invsizing-fetcher"' >> ~/.bashrc
echo 'alias loader="occ brand-invsizing-loader"' >> ~/.bashrc
echo 'alias uu="occ brand-unique-users-report-loader"' >> ~/.bashrc
echo 'alias footfall="occ footfall-attribution"' >> ~/.bashrc
echo 'alias audience="occ brand-pds-attribute-generator-process"' >> ~/.bashrc
echo 'alias schf="hadoop fs"' >> ~/.bashrc
echo 'alias schfrm="hadoop fs -rm -r -skipTrash"' >> ~/.bashrc
echo 'alias IEPD="iepd"' >> ~/.bashrc
echo 'alias IEFD="iefd"' >> ~/.bashrc
echo 'alias HDU="hdu"' >> ~/.bashrc
echo 'alias NOBCAT="nobcat"' >> ~/.bashrc
echo 'alias COBCAT="cobcat"' >> ~/.bashrc
echo 'alias fq="hadoop fs -count -q /secure/projects/cas"' >> ~/.bashrc
echo 'alias hnp="/home/lens/scripts/hnp.sh"' >> ~/.bashrc
echo 'alias cobraw="hadoop fs -ls /projects/cas/cbase-aggregate-logs/"' >> ~/.bashrc
echo 'alias cobhour="hadoop fs -ls /projects/cas/cob-generation/cbase_hourly_aggregate/"' >> ~/.bashrc
echo 'alias cobday="hadoop fs -ls /projects/cas/cob-generation/cob_daily_aggregate/"' >> ~/.bashrc
echo 'alias cobmonth="hadoop fs -ls /projects/cas/cob-generation/cob_monthly_aggregate/"' >> ~/.bashrc
echo 'alias casp="/home/lens/scripts/casp.sh"' >> ~/.bashrc
echo 'alias pwdd="/home/lens/scripts/pwdd.sh"' >> ~/.bashrc
echo 'alias syn="/home/lens/scripts/sync.sh"' >> ~/.bashrc
echo 'alias push="/home/lens/scripts/push.sh"' >> ~/.bashrc
echo 'alias yl="/home/lens/scripts/yarnLogs.sh"' >> ~/.bashrc
echo 'alias yk="/home/lens/scripts/yarnKill.sh"' >> ~/.bashrc
echo 'alias scpp="/home/lens/scripts/scpp.sh"' >> ~/.bashrc
echo 'alias cas="export USER=cas"' >> ~/.bashrc
echo 'alias brand="export USER=brand;rf"' >> ~/.bashrc
echo 'alias user="echo $USER"' >> ~/.bashrc
echo 'alias USER="user"' >> ~/.bashrc
echo 'alias mp="export USER=merlin-perf"' >> ~/.bashrc
echo 'alias lr=/home/lens/scripts/lensrestart.sh' >> ~/.bashrc
echo 'alias tailc="tail -f /usr/local/lens/client/logs/lensclient.log"' >> ~/.bashrc
echo 'alias tails="tail -f /usr/local/lens/server/logs/lensserver.log"' >> ~/.bashrc
echo 'alias a="alias"' >> ~/.bashrc
echo 'alias lens="/home/lens/scripts/lens/lens.sh"' >> ~/.bashrc
echo 'alias site="vi /usr/local/lens/server/conf/lens-site.xml"' >> ~/.bashrc
echo 'alias ctl="vi /usr/local/lens/server/bin/lens-ctl"' >> ~/.bashrc