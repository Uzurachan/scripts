#!/bin/bash

if [ $# -lt 2 ]; then echo "Usage: \$ $0 [filepath] [size/G]"; exit 1; fi

filepath=$1
size_of_giga=$2

dd if=/dev/zero of=${filepath} bs=1G count=${size_of_giga}
