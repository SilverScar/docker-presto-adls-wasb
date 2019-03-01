part_file=`date -d '12 hour ago' +%Y/%m/%d/%H`
casrr=/databus/streams_local/cas_rr/$part_file
echo $casrr
hadoop fs -du $casrr

