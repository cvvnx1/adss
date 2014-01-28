#!/bin/echo - "user add group process"

# Control flow:
# __user_install xxx
# __user_check xxx
# if [ $? -eq $ERROR_CODE ]; then
#   __user_uninstall xxx
#   exit 1
# fi
#
# __group_install xxx
# __group_check xxx
# if [ $? -eq $ERROR_CODE ]; then
#   __group_uninstall xxx
#   exit 1
# fi
#-----------------------------------------
__user_install(){
  useradd $*
  __log "$0 $LOG_INFO useradd $*"
}

__group_install(){
  groupadd $*
  __log "$0 $LOG_INFO groupadd $*"
}

__user_check(){
  local real_num=0
  local check_num=$#

  until [ $# -eq 0 ]; do
    if [ $(cat ${__user_file} | awk 'BEGIN{FS=":"} {print $1}' | grep "^$1$" | wc -l) -eq 1 ]; then
      real_num=$(expr ${real_num} + 1)
    fi
    shift
  done

  if [ ${real_num} -eq ${check_num} ]; then
    __log "$0 $LOG_INFO check user number match real user number"
    return $GENARAL_CODE
  else
    __log "$0 $LOG_ERROR checked user number not match real user number"
    return $ERROR_CODE
  fi
}

__group_check(){
  local real_num=0
  local check_num=$#

  until [ $# -eq 0 ]; do
    if [ $(cat ${__group_file} | awk 'BEGIN{FS=":"} {print $1}' | grep "^$1$" | wc -l) -eq 1 ]; then
      real_num=$(expr ${real_num} + 1)
    fi
    shift
  done

  if [ ${real_num} -eq ${check_num} ]; then
    __log "$0 $LOG_INFO check group number match real group number"
    return $GENARAL_CODE
  else
    __log "$0 $LOG_ERROR checked group number not match real group number"
    return $ERROR_CODE
  fi
}

__user_uninstall(){
  userdel $*
  __log "$0 $LOG_INFO userdel $*"
}

__group_uninstall(){
  groupdel $*
  __log "$0 $LOG_INFO groupdel $*"
}

