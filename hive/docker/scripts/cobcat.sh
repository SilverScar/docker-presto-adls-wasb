cob_ver=`ls /home/rajashekhar.c/libs/cob-gen* | xargs -n 1 basename | cut -d "-" -f3 |cut -d "." -f2`
echo $cob_ver

cob_gen_lib=`ls /home/rajashekhar.c/libs/cob-gen* | xargs -n 1 basename`
echo $cob_gen_lib

if [[ $cob_gen_lib == *"SNAPSHOT"* ]]
then
        echo "SNAPSHOT IS PRESENT"
        cob_ver=$cob_ver"-SNAPSHOT"
fi


#export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/home/rajashekhar.c/libs/yoda-proto-lib-1.0.132.jar:/home/rajashekhar.c/libs/hive-exec-0.13.0.2.1.5.0-695.jar:/home/rajashekhar.c/libs/yoda-commons-1.0.132-hdp.jar

#export LIBJARS=/home/rajashekhar.c/libs/yoda-proto-lib-1.0.132.jar,/home/rajashekhar.c/libs/hive-exec-0.13.0.2.1.5.0-695.jar,/home/rajashekhar.c/libs/yoda-commons-1.0.132-hdp.jar


part_hour=`date -d '12 hour ago' +%Y/%m/%d/%H`
part_file="/projects/cas/data/cbase-local/"$part_hour/lhr1/part-00000.gz
path=$1
hourly_partition="/projects/cas/data/cob-hourly-aggregate/"$part_hour/networkfact/part-00000.gz
echo ""
echo $hourly_partition


if [[ $path == '' ]]
then
	echo "using default path"
	path='/user/rajashekhar.c/newOutput/uj/part-r-00000'
	path=$part_file
fi
echo $path
#hadoop jar /home/rajashekhar.c/libs/cob-gen-0.$cob_ver.jar com.inmobi.cob.loader.COBCat -libjars ${LIBJARS} -f $path|less

hadoop jar /home/rajashekhar.c/libs/cob-gen-0.$cob_ver.jar com.inmobi.cob.loader.COBCat -f $path|less
