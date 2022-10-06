
send_automatic_mail_alert_when_ram_size_is_low.sh
==========================================================
#!/bin/bash
TO="dowithscripting@gmail.com"
TH_L=400
free_RAM=$(free -mt | grep -E "Total" | awk '{print $4}')

if [[ $free_RAM -lt $TH_L ]]
then
  echo -e "Server is running with low RAM Size\nAvaialbe RAM is: $free_RAM" | /bin/mail -s "RAM INFO $(date)" $TO
fi
==================================================================================================================
Cronjob:
-------
crontab -e
then write below and save it (for every min)
* * * * *  /bin/bash send_automatic_mail_alert_when_ram_size_is_low.sh
=======================================================================