RMHisoryUri=
SparkHistoryUri=
if [[ $CLUSTER == "pek1-pyrite" ]]
then
        RMHisoryUri="http://pyrm4001.grid.pek1.inmobi.com:19888/jobhistory/job"
	SparkHistoryUri="http://spark.grid.pek1.inmobi.com:18080/history/"
elif [[ $CLUSTER == "lhr1-emerald" ]]
then 
		RMHisoryUri="http://emerald-jt.grid.lhr1.inmobi.com:19888/jobhistory/job/"
		SparkHistoryUri="http://ersp1001.grid.lhr1.inmobi.com:18080/history/"
elif [[ $CLUSTER == "dfw1-onyx" ]]
then
                RMHisoryUri="http://oxrm4002.grid.dfw1.inmobi.com:19888/jobhistory/job/"
		SparkHistoryUri="http://oxsp1001.grid.dfw1.inmobi.com:18080/history/"
elif [[ $CLUSTER == "dfw1-platinum" ]]
then
                RMHisoryUri="http://plrm4002.grid.dfw1.inmobi.com:19888/jobhistory/job/"
                SparkHistoryUri="http://plns4002.grid.dfw1.inmobi.com:19090/history/"
elif [[ $CLUSTER == "ams1-azurite" ]]
then
                RMHisoryUri="http://azrm4001.grid.ams1.inmobi.com:19888/jobhistory/job/"
                SparkHistoryUri="http://spark.grid.ams1.inmobi.com:19090/history"
elif [[ $CLUSTER == "dfw2-garnet" ]]
then
                RMHisoryUri="http://garm4001.grid.dfw2.inmobi.com:19888/jobhistory/job/"
                SparkHistoryUri="http://spark.grid.dfw2.inmobi.com:19090/history"
fi
#echo $RMHisoryUri

job_url=`echo "$1" |sed -e 's/application/job/g'`

output=$RMHisoryUri$job_url
echo "normal job history url is "$output

output=$SparkHistoryUri$1"/1/jobs/"
echo "spark job history url is "$output


