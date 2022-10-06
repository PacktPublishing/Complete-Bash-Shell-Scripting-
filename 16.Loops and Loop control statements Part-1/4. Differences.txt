difference_between_$@_and$*.sh 
!/bin/bash

echo "The below output is for \$*"
for each in "$*"
do
  echo $each
done

echo "The below output is for \$@"
for each in "$@"
do
  echo $each
done
========================================