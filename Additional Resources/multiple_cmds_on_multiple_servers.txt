#!/bin/bash

<< my_com
echo "The date command output on the server: 100.26.187.33"
sshpass -f pass ssh -o StrictHostKeyChecking=No automation@100.26.187.33 "date"
echo "-------------------------------------------------------"
echo "The uptime command output on the server: 100.26.187.33"
sshpass -f pass ssh -o StrictHostKeyChecking=No automation@100.26.187.33 "uptime"
echo "-------------------------------------------------------"
echo "The free -m command output on the server: 100.26.187.33"
sshpass -f pass ssh -o StrictHostKeyChecking=No automation@100.26.187.33 "free -m"
echo "-------------------------------------------------------"
my_com


for each_ser in $(cat remote_servers.txt)
do
  echo "Executing cmds on $each_ser"
  echo "============================" 
  for each_cmd in date uptime "free -m"
  do
    echo "The $each_md command output on the server: $each_ser"
    #sshpass -f pass ssh -o StrictHostKeyChecking=No automation@$each_ser "$each_cmd"
    ssh -o StrictHostKeyChecking=No automation@$each_ser "$each_cmd"
    echo "-------------------------------------------------------"
  done

done 
