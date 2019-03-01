colo=$1
echo $colo

#feedName="FALCON_FEED_REPLICATION_CAS-local-cob-generation-feed3_"
feedName="FALCON_FEED_REPLICATION_CAS-local-cbase-orc-feed_"
if [[ $colo == "uh1" ]]
then
        colo=$colo"-krypton"
elif [[ $colo == "hkg1" ]]
then
        colo=$colo"-opal"
elif [[ $colo == "pek1" ]]
then
        colo=$colo"-pyrite"
elif [[ $colo == "dfw1" ]]
then
        colo=$colo"-onyx"
elif [[ $colo == "lhr1" ]]
then
        colo=$colo"-emerald"
fi
echo "the colo is "$colo
feedName=$feedName$colo"RUNNING"
echo "the feed name is "$feedName

output=`sudo -u $USER oozie jobs --oozie http://gold-oozie.grid.uh1.inmobi.com:11000/oozie/ -jobtype coordinator -len 30000 | grep -i $feedName`

echo "output is "$output
IFS=' ' read -r -a splitoutputArray <<< "$output"
coordinator=${splitoutputArray[0]}
echo "the coordinator is "$coordinator

#oozie job -info $coordinator
sudo -u $USER oozie job -len 30000 -info $coordinator
