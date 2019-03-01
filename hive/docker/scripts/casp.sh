actual_action=$1
action_w=`echo $actual_action | cut -d "@" -f1`
cas_job=`echo $actual_action | cut -d "@" -f2`

echo $action_w
echo $cas_job

folder=/home/cas/oozie-oozi/$action_w/$cas_job--ssh/

echo $folder
cd $folder

trackingUrl=`grep "tracking URL:"  $folder/*.stderr| head -1`
echo $trackingUrl
application=`echo $trackingUrl|cut -d "/" -f5`
echo $application
/home/rajashekhar.c/scripts/historyUrl.sh $application
