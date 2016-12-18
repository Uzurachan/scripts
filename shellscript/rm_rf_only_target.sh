#!/bin/bash

if [ $# -ge 0 ]; then
  DRY_RUN_OPTION=true
fi

# update these values
# e.g.
#   BASE_DIR=/user/hoge/fuga/foo
#   TARGET_CHILD=`cat <<-EOF
#   dira
#   dirb
#   filec
#   filed
#   EOF
BASE_DIR=.
TARGET_CHILDREN=`cat <<-EOF
hoge
dir1
dir2
file1
EOF`

BASE_DIR=`cd ${BASE_DIR}; pwd`

for child in ${TARGET_CHILDREN}
do
  target_path="${BASE_DIR}/${child}"

  # validation
  if [[ ${target_path} =~ \.\. ]]; then
    echo "Illegal target path : \"${target_path}\" ... Abort" >&2
    exit 1
  fi
  if [ ! -e ${target_path} ]; then
    echo "Not found \"${target_path}\" ... Abort" >&2
    exit 1
  fi
  if [ -L ${target_path} ]; then
    echo "Target path \"${target_path}\" is symbolic link, please unlink ... Abort" >&2
    exit 1
  fi

  # rm -rf
  if [ "${DRY_RUN_OPTION}" == "" ]; then
    rm -rf ${target_path}
    echo "rm -rf \"${target_path}\""
  else
    echo "(--dry-run) rm -rf \"${target_path}\""
  fi
done

echo "Finished"
