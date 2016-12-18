#!/bin/bash

function do_forced() {
  echo "do_forced"
}
 
function do_with_m_option() {
  echo "do_with_m_option $@"
}
 
function usage() {
  echo "Usage: "
  echo "  \$ $0 [-f|--force] [-h] [-m|--max-term]"
}
 
function do_other() {
  echo "do_other"
}
 
function main_function() {
  while [ $# -gt 0 ]; do
    arg=$1; shift
    case $arg in
      -f|--force)
        do_forced
        ;; 
      -m|--max-term)
        do_with_m_option "$1";
        ;;
      -h|*)
        usage
        ;; 
    esac
  done
}
main_function "$@"
 
# sample
# ./option_parser_sample.sh
# ./option_parser_sample.sh -f -m "1 months"
