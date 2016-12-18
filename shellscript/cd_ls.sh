#!/bin/bash

# we can add this function in .bashrc
function cd {
  builtin cd "$@" && ls
}
