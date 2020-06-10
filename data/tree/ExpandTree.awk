gawk '
{  x=4*$1; y=4*$2; z=4*$3;
   for (i=0;i<4;i++)
     for (j=0;j<4;j++)
       for (k=0;k<4;k++)
         print x+i,y+j,z+k,1
}'
