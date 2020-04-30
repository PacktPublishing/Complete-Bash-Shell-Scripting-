httpd:
------
start_httpd.sh   
#!/usr/bin/bash
sudo systemctl start httpd

stop_httpd.sh
#!/usr/bin/bash
sudo systemctl stop httpd

-----------------------------------------
tomcat
-------
start_tomcat.sh  
#!/usr/bin/bash
/home/automation/tomcat8/bin/startup.sh

stop_tomcat.sh
#!/usr/bin/bash
/home/automation/tomcat8/bin/shutdown.sh

==============================================

httpd and tomcat
----------------

stop_httpd_tomcat.sh
#!/usr/bin/bash
/home/automation/my_working_dir/stop_httpd.sh
/home/automation/my_working_dir/stop_tomcat.sh

start_httpd_tomcat.sh
#!/usr/bin/bash
/home/automation/my_working_dir/start_httpd.sh
/home/automation/my_working_dir/start_tomcat.sh