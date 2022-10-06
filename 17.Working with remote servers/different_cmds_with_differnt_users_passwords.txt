servers_info.txt
----------------
18.212.27.210  automation automation@123 date
18.212.185.2   tomcat tomcat123 whoami

execute_different_cmds_on_different_servers_with_differnt_users_and_passwords.sh
--------------------------------------------------------------------------------
#!/bin/bash
while read ser user pass cmd1 cmd2
do
  echo "Executing $cmd1 on $ser with user as $user and password $pass"
  sshpass -p $pass ssh -n -o StrictHostKeyChecking=No $user@$ser "$cmd1" 
  echo "Executing $cmd2 on $ser with user as $user and password $pass"
  sshpass -p $pass ssh -n -o StrictHostKeyChecking=No $user@$ser "$cmd2"
  echo "---------------------------------------------------------"
done < servers_info.txt
