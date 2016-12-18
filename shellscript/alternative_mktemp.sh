#!/bin/bash

type mktemp > /dev/null 2>&1 || {
  mktemp_fileno=0
  mktemp2() {
    (
      filename="/tmp/${0##*/}.$$.$mktemp_fileno"
      touch $filename
      chmod 600 $filename
      printf "%s\n" $filename
    )
    mktemp_fileno=$(($mktemp_fileno+1))
  }
}
