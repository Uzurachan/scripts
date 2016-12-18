#!/bin/bash

filepath=$1
bs=$2

if [ $# -lt 2 ]; then echo "Usage: \$ $0 [filepath] [bs]"; exit 1; fi
if [ "${filepath}" == "" ]; then echo "please set correct filepath."; exit 1; fi
if [ ! -w ${filepath} ]; then echo "please set writable filepath."; exit 1; fi
if [[ ! ${bs} =~ [0-9]+ ]]; then echo "please set correct bite size."; exit 1; fi

(rm ${filepath} && dd count=1 bs=${bs} of=${filepath}) < "${filepath}"
