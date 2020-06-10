#!/usr/bin/gawk -f

BEGIN{
  V[-1,-1,-1] = nV = 0            # If V[x,y,z]=n then XYZ[n]=x y z
  XYZ[0] = "-1 -1 -1"             # (It will always be like that)
}

function Vertex(x,y,z)
{
  if((x,y,z) in V)                # had that one already?
     return V[x,y,z]
  else {
     V[x,y,z] = ++nV              # a new one
     XYZ[nV] = x " " y " " z
     return nV
  }
}

function Face(x1,y1,z1, x2,y2,z2, x3,y3,z3, x4,y4,z4)
{
  v1 = Vertex(x1,y1,z1)           # get vertex numbers
  v2 = Vertex(x2,y2,z2)
  v3 = Vertex(x3,y3,z3)
  v4 = Vertex(x4,y4,z4)
  print "f ", v1, v2, v3, v4      # print one face
}

{
  A[$1,$2,$3]=1                 # read the input file
}

END{
  for(xyz in A) {
    split(xyz,sep,SUBSEP); x=sep[1]; y=sep[2]; z=sep[3]
    if (0==(x,y,z-1) in A) Face(x,y,z,   x,y+1,z,   x+1,y+1,z,   x+1,y,z  ) 
    if (0==(x,y,z+1) in A) Face(x,y,z+1, x+1,y,z+1, x+1,y+1,z+1, x,y+1,z+1) 
    if (0==(x,y-1,z) in A) Face(x,y,z,   x+1,y,z,   x+1,y,z+1,   x,y,z+1  ) 
    if (0==(x,y+1,z) in A) Face(x,y+1,z, x,y+1,z+1, x+1,y+1,z+1, x+1,y+1,z) 
    if (0==(x-1,y,z) in A) Face(x,y,z,   x,y,z+1,   x,y+1,z+1,   x,y+1,z  ) 
    if (0==(x+1,y,z) in A) Face(x+1,y,z, x+1,y+1,z, x+1,y+1,z+1, x+1,y,z+1) 
  }
  for(v=1;v<=nV;v++)              # output vertices
    print "v ", XYZ[v]
}
