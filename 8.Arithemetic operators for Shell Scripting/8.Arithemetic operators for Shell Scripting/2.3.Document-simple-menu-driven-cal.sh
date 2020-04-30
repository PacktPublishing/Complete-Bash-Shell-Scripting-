#!/usr/bin/bash
clear
read -p "Enter num-1: "  a
read -p "Enter num-2: "  b
echo "========================="
echo "Enter 1. Addition"
echo "      2. Sub"
echo "      3. Mul"
echo "      4. Div"
echo "========================="
read -p "Enter your option(1-4): " opt

case  $opt in
	1)
		echo "The addition of $a and $b is: $((a+b))"
	        ;;
	2)
		echo "The sub of $a and $b is: $((a-b))"	
		;;
	3)
		echo "The mul of $a and $b is: $((a*b))"
		;;
	4)	echo "The div of $a with $b is: $((a/b))"
		;;
	*)
		echo "Your entered invalid option"
		;;

esac
