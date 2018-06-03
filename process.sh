#!/bin/bash
file="matdyn.modes"
file2="bzo.dyn1"
grep -m1 -A 500 "\*" $file | grep -v "\*" | grep -v "freq (" | sed "s/""(""//g" | sed "s/"")""//g" >eigev.txt
grep -m1 -A 500 "Effective Charges" $file2 | tac |grep -m1 -A 500 "Effective Charges" | tac | grep -v "Effective Charges" | grep -v "atom" >atomeffect.txt
sed -i '/^$/d' atomeffect.txt
