# redres factor < in > out

gawk -v factor=$1 '

{print int($1/factor),int($2/factor),int($3/factor),$4}

' | Wcpipe 10000 | sort -n -k1,1 -k2,2 -k3,3 | gawk '

function zmajo(A,     i, mi, H)
{
  for (i in A)
    if(A[i] != 0)
      H[A[i]]++;
  H[0]=0
  mi=0
  for (i in H)
    if (H[i]>H[mi]) {
       mi=i
       m=H[i]
    }
  return mi
}

BEGIN{
  first=1
  p1=p2=p3=-1
}

{
  if ($1!=p1 || $2!=p2 || $3!=p3) {
    if (first==0) {
       print p1,p2,p3,zmajo(A)
       delete A
    }
    else
       first=0
    p1=$1; p2=$2; p3=$3;
    n=0
  }
  A[n++]=$4
}

END {
   print p1,p2,p3,zmajo(A)
}' | Wcpipe 10000
