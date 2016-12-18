#!/bin/bash

diff -u $1 $2 | grep -v '^ '
