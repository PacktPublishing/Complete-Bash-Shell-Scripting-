#!/usr/bin/bash
read -p "Enter any number: " num
case $num in
   [0-9])
	   echo "you enterd single number"
	   ;;
    [a-z])
	    echo "you entered lower case alph"
	    ;; 
    [A-Z])
	    echo "you enterd upper case alph"
	    ;;
    *)
	    echo "Unable to identify your input"
	    ;;

esac
