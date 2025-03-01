#!/bin/bash

dnf install mysql -y
dnf install git -y
USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "Error :: you must have sudo access to execute"
    exit 1
 fi

 dnf list installed mysql

 if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if[ $? -ne 0 ]
    then 
        echo "installing mysql ...FAILURE"
        exit 1
        else 
        echo "installing mysql ... SUCCESS"
        fi
        else
        echo "mysql is already ... INSTALLED"
        fi


        dnf list installed git

        if [ $? -ne 0 ]
        then 
        dnf install git -y
        if[ $? -ne 0 ]
        then 
        echo "instakking git ...FAILURE"
        exit 1
        else 
        echo "installimg git ...SUCCESS
        fi
        else 
        echo"Git is already ...INSTALLED"
        fi