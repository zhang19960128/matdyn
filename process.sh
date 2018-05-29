#!/bin/bash
file="matdyn.modes"
grep -m1 -A 500 "\*" $file | grep -v "\*" | grep -v "freq (" | sed "s/""(""//g" | sed "s/"")""//g" >eigev.txt
