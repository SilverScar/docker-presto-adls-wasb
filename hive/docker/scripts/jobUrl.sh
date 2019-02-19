job_url=
if [[ $CLUSTER == "uh1-gold" ]]
then
        job_url="http://glgm1004.grid.uh1.inmobi.com:8098/proxy/application"
elif [[ $CLUSTER == "hkg1-opal" ]]
then 
		job_url="http://opns4010.grid.hkg1.inmobi.com:19888/jobhistory/job/"
elif [[ $CLUSTER == "lhr1-emerald" ]]
then 
		job_url="http://emerald-jt.grid.lhr1.inmobi.com:19888/jobhistory/job/"
elif [[ $CLUSTER == "uj1-topaz" ]]
then 
		job_url="http://tzns4008.grid.uj1.inmobi.com:19888/jobhistory/job/"
elif [[ $CLUSTER == "uh1-krypton" ]]
then 
		job_url="http://krns4002.grid.uh1.inmobi.com:19888/jobhistory/job/"
elif [[ $CLUSTER == "dfw1-onyx" ]]
then
                job_url="http://oxrm4002.grid.dfw1.inmobi.com:19888/jobhistory/job/"
fi
#echo $job_url


str=$1

echo $str
arr=(${str/job/ })
echo ${arr[@]}
str=${arr[@]}
echo $str


output=$job_url$str
echo $output


