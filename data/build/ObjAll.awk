for i in `cat bldnum.txt`; do ./mkobj2.awk < bld$i.xyz | ./Wcpipe > bld$i.obj; done
exit