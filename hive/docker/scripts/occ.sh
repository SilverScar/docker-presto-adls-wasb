shopt -s expand_aliases
source ~/.bash_profile
echo $1
processName=$1
running="RUNNING"
processRunning=$processName$running
echo $processRunning
oc $processName| grep $processRunning|xargs sudo -u $USER oozie job -len 30000 -info
