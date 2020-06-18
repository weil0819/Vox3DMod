#!/usr/bin/gawk -f
# pol2class < polmodel.xyz | wcpipe > classmodel.xyz
BEGIN{
  c=0
  while(getline < "../ALLCLASSES")
    classes[$1]=++c
  printf "%d classes\n", c > "/dev/stderr"
  n=0
  while(getline < "CLASS")
    polclass[++n]=classes[$1]
  polclass[++n]=c+1 # "wrong" polygon number
  printf "%d polygons\n", n > "/dev/stderr"
}
{
  print $1,$2,$3,polclass[$4]
}
