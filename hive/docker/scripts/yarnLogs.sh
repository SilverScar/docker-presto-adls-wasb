echo $1
rm -rf temp.txt
sudo -u $USER yarn logs -applicationId $1 > temp.txt
vi temp.txt


