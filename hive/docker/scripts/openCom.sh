shopt -s expand_aliases
source ~/.bash_profile

command=$1
echo $command
filename=`alias $command| cut -d'=' -f2|cut -d"'" -f2`
echo $filename
vi $filename
