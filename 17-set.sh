#!/bin/bash

set -e

failure(){
    echo "Failed at $1: $2"
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u) #ERR

if  [ $USERID -ne 0 ]
then
    echo "plase run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "you are super user."
fi

dnf install mysqld -y
dnf install git -y

echo "is script proceeding?"