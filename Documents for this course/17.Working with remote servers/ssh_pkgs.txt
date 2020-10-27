Basic ssh command to run commands on remote server:

ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 "date"
----------------------------
Using sshpass (providing password for ssh):

sshpass -p "automation@123" ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 "date"
or
sshpass -f  path_for_password_file ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 "date"
or
export SSHPASS="automation@123"
sshpass -e ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 "date"


===========================================================================================================
 Amazon Linux EPEL:
 cd /opt 
 wget -r --no-parent -A 'epel-release-*.rpm' http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/
 yum install dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm
 
 RHEL8 EPEL:
    yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
============================================================================================================
