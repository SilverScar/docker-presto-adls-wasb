echo $1
coordinator=$1

#coordinator=0765885-160617091444722-oozie-oozi-W@ix_cob_generation_java
#coordinator=0696482-160617090533818-oozie-oozi-C@105
sudo -u cas oozie job -info $coordinator

echo "done"
job_coordinator=`sudo -u cas oozie job -info $coordinator | grep "External ID" |cut -d ":" -f2| cut -d " " -f2`
echo "the job coordinator is"$job_coordinator

if [ $job_coordinator != "-" ]
then
	historyUrl=`/home/rajashekhar.c/scripts/historyUrl.sh $job_coordinator`
	echo "the history url is $historyUrl"
fi

