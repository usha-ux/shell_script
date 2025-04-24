#!/bin/bash

USERID=$(id -u)

echo "the user id is::$USERID"

if [ $USERID -ne 0 ]

then

echo "you do not have acces take sudo access"

exit 1

fi

dnf list installed mysql

if [ $? -ne 0 ]
then

dnf install mysqll -y

    if [ $? -ne 0 ]
    then
    echo " my sql installlationn failuree.."
    exit 1

    else

    echo "mysql success"
    fi

else

echo " you have already installed mysql"
fi
