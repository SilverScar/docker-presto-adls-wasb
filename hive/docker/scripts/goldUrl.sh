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
hdfsUrl="webhdfs://gold-webhdfs.grid.uh1.inmobi.com:14000"$hdfsUrl
hadoop fs -ls $hdfsUrl



