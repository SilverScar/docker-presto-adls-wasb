partfile=`echo $1 | rev | cut -d'/' -f 1 | rev`
echo $1
echo $partfile
rm -rf $partfile
sudo -u $USER hadoop fs -get $1
echo "scp "`hostname`:`pwd`/$partfile .
url="http://"`hostname`":8090"/$partfile
echo $url
python -m SimpleHTTPServer 8090

