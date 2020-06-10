gawk -v delta=$1 '
BEGIN{
  if (delta=="") delta=100000;
}
{
  if (++n % delta == 0)
    printf "%11d\b\b\b\b\b\b\b\b\b\b\b", n > "/dev/stderr"
  print $0
}
END {printf "%11d\n", n > "/dev/stderr"
}'   
