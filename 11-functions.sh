    #!/bin/bash

    
    USERID=$(id -u)

    VALIDATE(){
        if [ $1 -ne 0 ]
        then 
        echo "$2 ...FAILURE"
        exit 1
        else 
        echo "$2 ...SUCCESS"
        fi
    }

    if [ $USERID -ne 0 ]
    then
        echo "Error :: you must have sudo access to execute"
        exit 1
    fi

    dnf list installed mysql

    if [ $? -ne 0 ]
    then 
        dnf install mysql -y
        VALIDATE $? "installing mysql"
        
    else
            echo "mysql is already ... INSTALLED"
    fi


            dnf list installed git

    if [ $? -ne 0 ]
    then 
            dnf install git -y
            VALIDATE $? "installing Git"
    else 
            echo "Git is already ...INSTALLED"
            fi