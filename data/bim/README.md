## BIM voxel data

- CLASS file
> Each row is an object name that corresponding to the object in polmodel.xyz

- polmodel.xyz file
> In each row, <x, y, z, objNum>, the last column is the object number, that is, we can fetch the object name from 'CLASS' file according to the 'objNum'.

> check how many rows in a file
```
wc -l <file>
cat <file> | wc -l
```

- MINXYZ file
> Minimum values for x, y, z.

- pol2class.awk file
> Transfer 'objNum' to 'classNum', that is, we just consider which class the voxel belong to.
```
chmod 755 pol2class.awk
../pol2class.awk < polmodel.xyz > classmodel.xyz
```

- ALLCLASS file
> 26 different kind of IFC class name.(Starting from 1)

> Check file size and directory size
```
ls -al
du -sh
```

- mkobj2.awk file
> make an .obj file from a voxel .xyz file.
```
chmod 755 mkobj2.awk
gawk -f mkobj2 voxel.xyz > voxel.obj
../mkobj2.awk < voxel.xyz > voxel.obj
```


