display_files.sh
------------------
#!/bin/bash
#ls
<< mcom
for each_file in $(ls)
do
   echo "$each_file"
done
mcom

<< scom
cnt=1
for each_file in $(ls *.txt)
do
  if [[ $cnt -eq 1 ]]
  then 
     echo "$each_file"
     ((cnt++))
  fi
done
scom

echo "starting for loop"
cnt=1
for each_file in $(ls *.txt)
do
	if [[ $cnt -eq 1 ]]
	then
           echo "$each_file"
	   break
	fi
done

echo "for loop is over"
===============================
display_numbers.sh
-----------------
#!/bin/bash
echo "starting for loop"
<< mycom
for each in $(seq 1 10)
do
  if [[ $each -gt 5 ]]
  then
	 break
  fi 
  echo "$each"
done
mycom

<< com
for each in $(seq 1 10)
do
  if [[ $each -ne 5 ]]
  then
     echo "$each"
  fi

done

com

for each in $(seq 1 10)
do
   if [[ $each -eq 5 ]]
   then
	   continue
   fi	 

   echo "$each"
done

echo "for loop is over"
=============================