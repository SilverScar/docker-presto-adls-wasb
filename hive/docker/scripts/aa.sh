shopt -s expand_aliases
source ~/.bash_profile
alias_name=$1
echo $alias_name
output=`alias $alias_name`
echo $output
file_path=`alias $alias_name|cut -d'=' -f2| sed "s/'//g"`
echo $file_path
vi $file_path

