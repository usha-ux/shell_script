#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then
echo "you do not have access you must have sudo access"

exit 1
fi

dnf list insatlled mysql

if [ $? -ne 0 ]
then

dnf install mysql -y
  if [$? -ne 0 ]

  then  

    echo "mysql installation failure.."
    exit 1
    else 
    echo "mysql installations success.."
    fi
else

echo "mysql already installed in your system.."

fi

