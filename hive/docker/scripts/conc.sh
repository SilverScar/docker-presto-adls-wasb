echo $1
echo $2

echo "oozie job -change  $1 -value concurrency=$2"
sudo -u $USER oozie job -change  $1 -value concurrency=$2

