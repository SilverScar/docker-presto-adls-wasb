str=$1
arr=(${str/gold/ })
echo ${arr[0]}
echo ${arr[@]}
hdfsUrl=${arr[1]}
if [[ $hdfsUrl == "" ]]
then
	echo "it is empty" 
	hdfsUrl=${arr[0]}
fi 
echo $hdfsUrl

hadoop fs -ls $hdfsUrl

coloarr=(${str//// })
echo ${coloarr[@]}
len=${#coloarr[*]}
echo $len
coloname=${coloarr[$len-2]}
echo $coloname

colohdfsurl=
if [[ $coloname == "uh1" ]]
then
        colohdfsurl="webhdfs://krypton-webhdfs.grid.uh1.inmobi.com:14000"$hdfsUrl
elif [[ $coloname == "hkg1" ]]
then
        colohdfsurl="webhdfs://opal-webhdfs.grid.hkg1.inmobi.com:14000"$hdfsUrl
elif [[ $coloname == "uj1" ]]
then 
	colohdfsurl="webhdfs://topaz-webhdfs.grid.uj1.inmobi.com:14000"$hdfsUrl
elif [[ $coloname == "lhr1" ]]
then
        colohdfsurl="webhdfs://emarald-webhdfs.grid.lhr1.inmobi.com:14000"$hdfsUrl

fi

echo $colohdfsurl
hadoop fs -ls $colohdfsurl


