#!/usr/bin/bash
clear
read -p "Enter your file extention: " ext
case $ext in
	".txt")
		ls -lrt *.txt
		;;
	".sh")
		ls -lrt *.sh
		;;
	*)
		echo "Sorry!. You entered invalid file extention"
		;;
esac
