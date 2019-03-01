cd /usr/local/lens/server/logs
rm -rf *
sleep 2
/usr/local/lens/server/bin/lens-ctl stop
/usr/local/lens/server/bin/lens-ctl start
cd /usr/local/lens/server/bin

