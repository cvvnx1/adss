#!/bin/echo - "function"

# usage:
# return_val=$(__timestamp)
#-----------------------------------------
__timestamp(){
  echo $(date +%Y/%m/%d\ %H:%M:%S)
}

# usage:
# return_val=$(__datestamp)
#-----------------------------------------
__datestamp(){
  echo $(date +%Y%m%d)
}
