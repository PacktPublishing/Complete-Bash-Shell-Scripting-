========================================
intro_loops.sh

#!/bin/bash

for each in 1 2 3 4 5
do
  echo "Welcome to shell scripting"
  echo "We done with very basics"
  echo "Now we are starting loops concepts"
done


===========================================
check_ex_per.sh

#!/bin/bash

<< com
if [[ -x httpd_info.sh ]]
then
  echo "httpd_info.sh is having execution permission" 
else
  echo "httpd_info.sh is not having execution permission"
fi


if [[ -x httpd_ver_port.sh ]]
then
   echo "httpd_ver_port.sh is having execution permission" 
else
   echo "httpd_ver_port.sh is not having execution permission"
fi

com

#for each in httpd_info.sh httpd_ver_port.sh check_ex_per.sh
for each in $(ls)
do
  if [[ -x $each ]]
  then
    echo "$each is having execution permission" 
  else
    echo "$each is not having execution permission"
  fi
done
======================================================================
check_ex_per_of_files_for_given_dir.sh

#!/bin/bash

if [[ $# -ne 1 ]]
then
	echo "Usage: $0 <any_path>"
	exit 
fi


given_path=$1
for each in $(ls $given_path)
do
  if [[ -x $each ]]
  then
      echo "$each is having execution permission" 
  else
      echo "$each is not having execution permission"
  fi
done
========================================================