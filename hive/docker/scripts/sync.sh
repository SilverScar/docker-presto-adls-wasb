cd
rm -rf scripts-backup
mv scripts scripts-backup
hadoop fs -get webhdfs://platinum-webhdfs.grid.dfw1.inmobi.com:14000/user/rajashekhar.c/scripts
cd
cd scripts
chmod 777 *.sh
