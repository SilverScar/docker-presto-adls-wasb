local_path="/data/lda/nob/rrcube/`date -d '12 hour ago' +%Y/%m/%d/%H`/lhr1/part-00000"
global_path="/user/yoda/warehouse/localdc/rrcube/transformationoutput2/`date -d '12 hour ago' +%Y-%m-%d-%H`/lhr1/part-00000"

export HADOOP_CLASSPATH=/home/rajashekhar.c/libs/hive-exec-0.13.0.2.1.5.0-695.jar:/home/rajashekhar.c/libs/yoda-commons-1.0.132-hdp.jar
selected_path=""
if [[ $CLUSTER == 'uh1-gold' ]]
then
	echo "global colo"
	selected_path=$global_path
else
	echo "local colo"
	selected_path=$local_path
fi

path=$1
if [[ $path == '' ]]
then
        echo "using default path"
        path='/user/rajashekhar.c/newOutput/uj/part-r-00000'
        path=$selected_path
fi

echo $selected_path
hadoop jar /home/rajashekhar.c/libs/yoda-log-extractor-0.6.285.jar com.inmobi.dw.yoda.util.NOBCat  -libjars /home/rajashekhar.c/libs/hive-exec-0.13.0.2.1.5.0-695.jar,/home/rajashekhar.c/libs/yoda-commons-1.0.132-hdp.jar -f $path|less
