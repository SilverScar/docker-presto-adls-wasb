echo bind "set completion-ignore-case on"

PS1='\[\e[0;33m\]\h:\W \u\$\[\e[m\] '
alias refresh="source ~/.bash_profile"
alias rf='source /home/lens/scripts/.bash_profile'
alias profile="vi ~/.bash_profile"
alias pf='vi /home/lens/scripts/.bash_profile'
alias ll="ls -l"
alias hn="hostname"
alias scripts="cd /home/lens/scripts"


export LC_CTYPE="en_US.UTF-8"
alias hl="hadoop fs -ls"
alias hc="hadoop fs -cat"
alias hg="hadoop fs -get"
alias hp="hadoop fs -put"
alias hrm="hadoop fs -rm"
alias hrmr="hadoop fs -rm -r -skipTrash"

alias pigr="sudo -u reports pig -Dmapred.job.queue.name=reports"
alias pigc="sudo -u cas pig -Dmapred.job.queue.name=pmatics"
alias pigb="sudo -u brand pig -Dmapred.job.queue.name=brand"
alias pigl="pig -x local"

alias nobcat='/home/lens/scripts/nobcat.sh'
alias cobcat='/home/lens/scripts/cobcat.sh'
alias hduu="hadoop fs -du"
alias hdu="hadoop fs -du -h"





alias rep="/home/lens/scripts/rep.sh"
alias rerun="/home/lens/scripts/rerun.sh"
alias rrf="/home/lens/scripts/rerunFull.sh"
alias rr="rerun"
alias killer='/home/lens/scripts/killer.sh'
alias url="/home/lens/scripts/historyUrl.sh"
alias joburl="/home/lens/scripts/jobUrl.sh"
alias coloUrl="/home/lens/scripts/coloUrl.sh"
alias occ='/home/lens/scripts/occ.sh'
alias uac='/home/lens/scripts/uac.sh'
alias uacc='vi /home/lens/scripts/uac.sh'
alias a='alias'
alias aa='/home/lens/scripts/aa.sh'
alias aaa='/home/lens/scripts/aaa.sh'
alias jobUrl='/home/lens/scripts/jobUrl.sh'

alias sudocasput='hadoop fs -put'
alias sch='cd /home/lens/scripts'
alias ht='/home/lens/scripts/ht.sh'
alias conc='/home/lens/scripts/conc.sh'
alias allruns='/home/lens/scripts/allruns.sh'
alias oji='/home/lens/scripts/oji.sh'

alias LL='ll'
alias PIG='pig'
alias CD='cd'
alias PWD='pwd'
alias PF='pf'
alias RF='rf'
alias HL='hl'
alias HC='hc'
alias HT='ht'
alias cobp='occ CAS-local-cbase-generator'
alias COBP='cobp'
alias cobpr='occ CAS-local-cbase-generator-regen'
alias cobh='occ CAS-cbase-hourly-aggregate'
alias cobho='occ cob-hourly-aggregate-process'
alias cobd='occ COB-daily-aggregate-process'
alias cobdr='occ COB-daily-rtbd-china-aggregate-process'
alias cobm='occ COB-monthly-aggregate-process'
alias cobb='occ CAS-RR-backup-process'
alias creative='occ CAS-rtbd-adcontent-tar-generator'
alias rmc='occ CAS-rmc-daily-generator'
alias fc='occ brand-fcreporting'
alias inv='occ brand-invsizing-fetcher'
alias loader='occ brand-invsizing-loader'
alias uu='occ brand-unique-users-report-loader'
alias footfall='occ footfall-attribution'
alias audience='occ brand-pds-attribute-generator-process'

alias schf='hadoop fs'
alias schfrm='hadoop fs -rm -r -skipTrash'
alias IEPD='iepd'
alias IEFD='iefd'
alias HDU='hdu'
alias NOBCAT='nobcat'
alias COBCAT='cobcat'
alias fq='hadoop fs -count -q /secure/projects/cas'
alias hnp='/home/lens/scripts/hnp.sh'
alias cobraw='hadoop fs -ls /projects/cas/cbase-aggregate-logs/'
alias cobhour='hadoop fs -ls /projects/cas/cob-generation/cbase_hourly_aggregate/'
alias cobday='hadoop fs -ls /projects/cas/cob-generation/cob_daily_aggregate/'
alias cobmonth='hadoop fs -ls /projects/cas/cob-generation/cob_monthly_aggregate/'
alias casp='/home/lens/scripts/casp.sh'
alias pwdd='/home/lens/scripts/pwdd.sh'
alias syn='/home/lens/scripts/sync.sh'
alias push='/home/lens/scripts/push.sh'
alias yl='/home/lens/scripts/yarnLogs.sh'
alias yk='/home/lens/scripts/yarnKill.sh'
alias scpp='/home/lens/scripts/scpp.sh'

alias cas='export USER=cas'
alias brand='export USER=brand;rf'
alias user='echo $USER'
alias USER='user'
alias mp='export USER=merlin-perf'


alias lr=/home/lens/scripts/lensrestart.sh
alias tailc='tail -f /usr/local/lens/client/logs/lensclient.log'
alias tails='tail -f /usr/local/lens/server/logs/lensserver.log'
alias a='alias'
alias lens='/home/lens/scripts/lens/lens.sh'
alias site='vi /usr/local/lens/server/conf/lens-site.xml'
alias ctl='vi /usr/local/lens/server/bin/lens-ctl'
