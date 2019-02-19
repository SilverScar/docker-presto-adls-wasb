sudo -u cas hadoop fs -rmr /projects/cas/cob-generation/libsBackup
hl /projects/cas/cob-generation/
sudo -u cas hadoop fs -mv /projects/cas/cob-generation/libs /projects/cas/cob-generation/libsBackup
sudo -u cas hadoop fs -put /home/rajashekhar.c/libs /projects/cas/cob-generation/
sudo -u cas hadoop fs -rm /projects/cas/cob-generation/cas.pig.backup
sudo -u cas hadoop fs -mv /projects/cas/cob-generation/cas.pig /projects/cas/cob-generation/cas.pig.backup
sudo -u cas hadoop fs -put /home/rajashekhar.c/falcon/cas.pig /projects/cas/cob-generation/
hc /projects/cas/cob-generation/cas.pig
