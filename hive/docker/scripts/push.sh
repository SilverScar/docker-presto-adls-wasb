hadoop fs -rm -r -skipTrash /user/rajashekhar.c/scripts-backup
hadoop fs -mv /user/rajashekhar.c/scripts  /user/rajashekhar.c/scripts-backup
cd 
hadoop fs -put scripts .
