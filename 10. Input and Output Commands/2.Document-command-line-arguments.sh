#!/usr/bin/bash
<< mycom
echo "$0"
echo "$1"
echo "$2"
echo "$3"
echo "${10}"
mycom

echo "The number command line arguments: $#"
echo "All command line arguments are: $*"
echo "All command line arguments are: $@"
