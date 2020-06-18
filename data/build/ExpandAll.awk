#BLD=`imal "z =: }. /:~ ~. , sel" "echo z"`
#tail --lines +3 sel.pgm | byte2asc | sort -nu | tail --lines +2 > bld.txt
for i in `cat bldnum.txt`; do ./ExpandBld $i < bld$i.vox | ./Wcpipe > bld$i.xyz; done
exit
