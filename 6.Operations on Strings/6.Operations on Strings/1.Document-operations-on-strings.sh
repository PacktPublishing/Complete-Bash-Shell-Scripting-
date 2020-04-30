#!/usr/bin/bash
<< mycom1
my_name="shell s"
my_name_len=${#my_name}
echo "$my_name"
#echo "${#my_name}"
echo "${my_name_len}"
mycom1

<< mycom2
path1="/etc/httpd/conf"
path2="httpd.conf"

httpd_conf_file_path=${path1}/${path2}
echo "$httpd_conf_file_path"
mycom2

<< mycom3
my_name="sHeLl"
my_name_up=${my_name^^}
my_name_lo=${my_name,,}
echo "upper data: $my_name_up"
echo "lower data: $my_name_lo"
echo "$my_name"
mycom3


httpd_conf_path_file="/etc/httpd/conf/httpd.conf"
httpd_conf_home=$(dirname $httpd_conf_path_file)
httpd_conf_file=$(basename $httpd_conf_path_file)
httpd_conf_file_without_suffix=$(basename $httpd_conf_path_file .conf)
echo "httpd conf path file: $httpd_conf_path_file"
echo "httpd conf home: $httpd_conf_home"
echo "httpd conf file: $httpd_conf_file"

echo "$httpd_conf_file_without_suffix"
