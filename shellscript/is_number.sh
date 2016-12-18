#!/bin/bash

function is_number_prototype() {
  number=$1
  if [ `echo ${number} | cut -c 1` == '-' ]; then
    number=`echo ${number} | cut -c 2-`
  fi

  case ${number} in
    ''|*[^0-9.]*) return 1;;
    *) return 0;;
  esac
}

# test
#if is_number_prototype 1.59234; then echo patern a is true; fi
#if is_number_prototype -1.59234; then echo pattern b is true; fi
#if is_number_prototype 1.592e6; then echo pattern c is true; fi
#if is_number_prototype q; then echo pattern d is true; fi

function is_number() {
  return `awk -v n="$1" 'BEGIN {print (n != n+0)}'`
}

# test
if is_number 1.59234; then echo patern a is true; fi
if is_number -1.59234; then echo pattern b is true; fi
if is_number 1.592e6; then echo pattern c is true; fi
if is_number 1,000.25; then echo pattern d is true; fi
if is_number q; then echo pattern e is true; fi
