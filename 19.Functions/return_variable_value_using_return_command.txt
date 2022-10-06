#!/bin/bash

return_variable()
{
  local x="shell"
  return $x
}


return_variable
y=$?
echo "The value of y is: $y"
