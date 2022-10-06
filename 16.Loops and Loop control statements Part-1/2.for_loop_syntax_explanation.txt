basic_for_loop.sh
-----------------
#!/bin/bash
#for each_value in 1 2 3
for each_file in $(ls)
do
   echo "this is a loop"
   echo "for this iteration each_value is: $each_file"
done
=======================================================
c_type_for_loop.sh
------------------
#!/bin/bash
clear
echo "we are working with loops"
for((cnt=1;cnt<=20;cnt++))
do
  echo "$cnt"
done

echo "we complete for loop"
==================================================
infi_for_loop.sh
----------------
#!/bin/bash
echo "This is a for loop"
cnt=1
for((;;))
do
  echo "this is infi loop"
  ((cnt++))
  sleep 1
  if [[ $cnt -eq 10 ]]
  then
	  break
  fi
done


echo "out of loop"
====================================================