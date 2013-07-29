#!/bin/bash

script_path=$(dirname $(readlink -f "$0"))

# debug: . ${script_path}/include/dialog.sh
. ${script_path}/include/config.sh
. ${script_path}/include/atomfunc.sh

# debug: . ${script_path}/include/proftpdmysql.sh

# config initial
config_userdefined_null
config_systemenv_null
config_vision_null

