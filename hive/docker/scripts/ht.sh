path=$1
sudo -u $USER hadoop fs -text $path|less
