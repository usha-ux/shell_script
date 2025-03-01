    #!/bin/bash

    
    USERID=$(id -u)
    R="\e[31m"
    G="\e[32m"
    Y="\e[33m"
    N="\e0m"

    LOGS_FOLDER="/var/log/shellscript-logs"
    LOG_FILE=$( echo $0 | cut -d "." -f1 )
    TIMESTAMP=( date +%y-%m-%d-%H-%M-%S )
    LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"


    VALIDATE(){
        if [ $1 -ne 0 ]
        then 
        echo -e "$2 ... $R FAILURE $N"
        exit 1
        else 
        echo -e "$2 ... $G SUCCESS $N"
        fi
    }
    echo "script started excuting at : $TIMESTAMP" &>>$LOG_FILE_NAME

    if [ $USERID -ne 0 ]
    then
        echo "Error :: you must have sudo access to execute"
        exit 1
    fi

        for package in $@
        do 
           dnf list inatalled $package -y &>>$LOG_FILE_NAME
        if [ $? -ne 0 ]
        then 
            dnf install $package -y &>>$LOG_FILE_NAME
            VALIDATE $? "Inatalling $package"
        else
            echo "$package is already ... installed"
        fi
        done
