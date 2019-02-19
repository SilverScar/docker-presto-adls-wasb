rm -rf /home/lens/scripts/lens/temp
mkdir /home/lens/scripts/lens/temp
cd /home/lens/scripts/lens/temp
hadoop fs -get $1
file=`echo $1 | cut -d "/" -f6`
unzip $file
part_file=`echo $file| cut -d "." -f1`_part-0.csv
echo $part_file
vi $part_file