#!/bin/echo - "log process"

# usage:
# __log_init
#-----------------------------------------
__log_init(){
  mkdir -pv ${__log_folder}
}

# usage:
# __log "log information"
#-----------------------------------------
__log(){
  local datestamp=$(__datestamp)
  local timestamp=$(__timestamp)
  echo "${timestamp} $*" >> ${__log_folder}/${datestamp}.log
}
