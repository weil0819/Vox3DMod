Data in .vox format is not the final voxel files. 

For building, tree and DTM data:
Data in .xyz for mat is the final voxel files, and <x,y,z,value>. The voxel size is 20*20*20.
There are 52 buildings, the value is the building number.
There are two dtm's (you only need one). The one called dtm is the terrain like if there were no builidngs. The one called dtmbot is a terrain with holes, in which the buildings fit (buildings extend 3m under the terrain). So if you use dtm together with the buildings, some voxels will occur twice: in the terrain and in a building. It you use dtmbot, instead of dtm, all voxels will be unique: either terrain or building.

```
cp ../script/Wcpipe ../script/ExpandBld ../script/mkobj2 ./build
cd build
chmod 755 ExpandBld Wcpipe mkobj2
./ExpandAll
./ObjAll
```

```
cp ../script/ExpandTree ../script/Wcpipe ../script/mkobj2 ./tree
cd ./tree
chmod 755 ExpandTree Wcpipe mkobj2
./ExpandTree < tree.vox | ./Wcpipe > tree.xyz
./mkobj2 < tree.xyz | ./Wcpipe > tree.obj
```

```
<!-- For Linux -->
cp ../script/ExpandDtm ../script/Wcpipe ../script/mkobj2 ./dtm
cd ./dtm
chmod 755 ExpandDtm Wcpipe mkobj2
./ExpandDtm< dtm.vox | ./Wcpipe > dtm.xyz
./ExpandDtm< dtmbot.vox | ./Wcpipe > dtmbot.xyz
./mkobj2 < dtm.xyz | ./Wcpipe > dtm.obj
./mkobj2 < dtmbot.xyz | ./Wcpipe > dtmbot.obj  

<!-- For Windows -->
.\gawk.exe '{for(i=1;i<=$3;i++) print $1,$2,i,1}' dtm.vox > dtm.xyz
```


For BIM data:
The BIM model stuff is a little bit more complicated. You have 6 folders, one per building. The resolution is 10 cm, the values in the 4th column are objectnumbers, starting from 1. In each folder is a file called CLASS with on each line i the class of object i (a string). In the top folder is a file called ALLCLASSES with 26 of those strings.

There is also a script called pol2class, which you can run in each folder, for example:
```
cd Dalton
./pol2class <plomodel.xyz> classmodel.xyz
```
Then you will get a new file where the 4th column is a class number, according to the lines in ALLCLASSES (starting at 1 again).
You can also change the resolution, for example if you want 20 cm in Dalton you go:
```
./redres 2 < polmodel.xyz > pm20.xyz
```
Should also work with classmodel, and for example to get 40cm resolution (redres 4 < classmodel.xyz > cm40.xyz). It should even work with the models you got Yesterday.

It makes a new voxel value by combining the 'old' ones in a majority operator
When you want to make 'real' coordinates from xyz files you have to multiply with te resolution (0.1m in the original files, or 0.2 or 0.4 after you used redres), and then add the offsets that are in MINXYZ in each folder (probably using gawk, or in the database...).

