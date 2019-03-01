str=$1
arr=(${str//@/ })
echo ${arr[@]}
job=${arr[0]}
coordinator=${arr[1]}
echo $job
echo $coordinator

oozie job -rerun $job -action $coordinator -failed
