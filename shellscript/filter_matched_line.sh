#!/bin/bash

#$ cat hoge.txt
#abc  nyannyan  scx0132  0.154   hoge   fuga
#abc  nyannyan  scx0132  0.152   hoge   fuga
#abc  nyannyan  scx0132  1.154   hoge   fuga
#abc  nyannyan  scx0132  0.154   hoge   fuga
#abc  nyannyan  scx0132  3.14   hoge   fuga
#abc  nyannyan  scx0132  0.154   hoge   fuga
#abc  nyannyan  scx0132  4.013   hoge   fuga
#abc  nyannyan  scx0132  0.154   hoge   fuga

awk '$4 > 1' hoge.txt

# if you want to execute bash -c option
bash -c "awk '\$4 > 1' hoge.txt"
