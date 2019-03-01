str=$1
arr=(${str//@/ })
echo ${arr[@]}
job=${arr[0]}
coordinator=${arr[1]}
echo $job
echo $coordinator

sudo -u $USER oozie job -kill $job -action $coordinator -nocleanup -refresh
