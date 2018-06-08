#!/bin/bash
file="pbematdyn.modes"
file2="pbebzo.dyn1"
grep -m1 -A 500 "\*" $file | grep -v "\*" | grep -v "freq (" | sed "s/""(""//g" | sed "s/"")""//g" >eigev.txt
grep -m1 -A 500 "Effective Charges" $file2 | tac |grep -m1 -A 500 "Effective Charges" | tac | grep -v "Effective Charges" | grep -v "atom" >atomeffect.txt
sed -i '/^$/d' atomeffect.txt
count=`grep "freq (" $file | grep -Eo "[\-]{0,1}[0-9]{0,9}[\.]{1}[0-9]{1,10}" | wc -l`;
count=`expr $count \/ 2`;
usefulline="";
for i in `seq 1 $count`
do
    temp=`expr 2 \* $i`;
    usefulline=$usefulline"${temp}p;";
done
grep "freq (" $file | grep -Eo "[\-]{0,1}[0-9]{0,9}[\.]{1}[0-9]{1,10}" >temp.txt;
sed -n $usefulline temp.txt >fre.txt
rm temp.txt
