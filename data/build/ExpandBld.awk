gawk -v v=$1 '{for(i=$3;i<=$4;i++) print $1,$2,i,v}' 
