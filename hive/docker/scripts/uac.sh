#shopt -s expand_aliases
#source ~/.bash_profile
echo $1
coordinator=$1

if [[ $coordinator == *"@"* ]]
then
	echo "@ coordinator" $coordinator;
	coordinator=`sudo -u $USER oozie job -info $coordinator|grep "External ID"|cut -d ":" -f2|cut -d " " -f2`
fi

user_action=`sudo -u $USER oozie job -info $coordinator|grep "user-action"`
if [[ $user_action == "" ]]
then
	echo "it is getting replication"
	replication=$coordinator"@replication"
	echo $replication
	sudo -u $USER oozie job -info  $replication
else
	echo "it is user acion"
	useraction=$coordinator"@user-action"
	echo $useraction
	sudo -u $USER oozie job -info  $useraction
	workflows_coordinator=`sudo -u $USER oozie job -info $useraction| grep "External ID"|cut -d ":" -f2|cut -d " " -f2`
	echo $workflows_coordinator
	sudo -u $USER oozie job -info  $workflows_coordinator
	workflow_coordinator=`sudo -u $USER oozie job -info $workflows_coordinator| grep "inventory-sizing-weekly-summerizer\|inventory-sizing-pig\|pds_attribute_generation\|cbase_generation\|pushtobilling\|cas_network_site_pig\|cas_apportioner_pig\|ix_cob_generation\|cas_billing_pig\|cas_dwh_daily_pig\|caspub\|ix_package_summary_aggr_pig\|cas_rr_backup"|cut -d " " -f1`
	echo $workflow_coordinator
	sudo -u $USER oozie job -info  $workflow_coordinator
	job_coordinator=`sudo -u $USER oozie job -info  $workflow_coordinator | grep "External ID" |cut -d ":" -f2| cut -d " " -f2`
        echo $job_coordinator
        historyUrl=`/home/rajashekhar.c/scripts/historyUrl.sh $job_coordinator`
        echo "the history url is $historyUrl"
	if [[ $workflow_coordinator == *"cbase"* ]]
	then
		echo "it is spark job"
		/home/rajashekhar.c/scripts/casp.sh $workflow_coordinator
	fi
fi

