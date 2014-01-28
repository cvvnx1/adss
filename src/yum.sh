#!/bin/bash

__yum_install(){
  yum install -y $*
}

__yum_installed_check(){
  local real_num=0
  local check_num=$#

  until [ $# -eq 0 ]; do
    if [ $(yum list installed | grep "$1\." | awk '{print $1}' | wc -l) != "0" ]; then
      real_num=$(expr ${real_num} + 1)
    fi
    shift
  done

  if [ ${real_num} -eq ${check_num} ]; then
    return 10
  else
    return 99
  fi
}

__yum_uninstall(){
  yum erase -y $*
}

#__yum_installed_check $*
#echo $?

# Control flow:
# __yum_install xxx yyy zzz
# __yum_installed_check xxx yyy zzz
# if [ $? -ne ]; then
#   __yum_uninstall xxx yyy zzz
# fi
