#!/bin/bash

echo "all variables passed : $@"
echo "number of varisbles : $#"
echo "script name : $0"
echo "present working directory : $pwd"
echo "home directory of current user : $HOME"
echo "which user is running this script : $USER"
echo "process id of current scripts : $$"
sleep 60 &
echo "process id of last command in background: $!"