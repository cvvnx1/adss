#!/bin/echo - "yum process"

# Control flow:
# __yum_install xxx yyy zzz
# __yum_check xxx yyy zzz
# if [ $? -eq $ERROR_CODE ]; then
#   __yum_uninstall xxx yyy zzz
# fi
#-----------------------------------------
__yum_install(){
  yum install -y $*
  __log "$0 $LOG_INFO yum install -y $*"
}

__yum_check(){
  local real_num=0
  local check_num=$#

  until [ $# -eq 0 ]; do
    if [ $(yum list installed | grep "$1\." | awk '{print $1}' | wc -l) != "0" ]; then
      real_num=$(expr ${real_num} + 1)
    fi
    shift
  done

  if [ ${real_num} -eq ${check_num} ]; then
    __log "$0 $LOG_INFO yum installed apps number is match checked apps"
    return $GENARAL_CODE
  else
    __log "$0 $LOG_ERROR yum installed apps number is not match checked apps"
    return $ERROR_CODE
  fi
}

__yum_uninstall(){
  yum erase -y $*
  __log "$0 $LOG_INFO yum uninstall app $*"
}

