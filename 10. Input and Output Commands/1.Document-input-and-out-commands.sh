#!/usr/bin/bash
<< mycom
read -p "Enter your name: " my_name
my_name_up=${my_name^^}
echo "Your name in upper-case is: $my_name_up"
mycom

read -p "Enter your name: " 
echo "$REPLY"
