#!/bin/bash
display()
{
  y=55
  echo "The variable value of x is: $x"
  local x=67
  local p=78
}

x=5
display

echo "The value of a variable y is: $y"
echo "The x value after calling display function: $x"
echo "The value of p is: $p"
