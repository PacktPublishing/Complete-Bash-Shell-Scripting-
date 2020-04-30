#!/bin/bash

addition()
{
  #echo "The \$0 value is: $0"
  m=$1
  n=$2
  result=$((m+n))
  echo "The addition of $m and $n is: $result"

}


x=6
y=2
addition $x $y

p=3
q=7
addition $p $q

addition 4 9

