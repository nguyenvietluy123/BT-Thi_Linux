#!/bin/bash

if [ "$1" = 0 ]
then
    echo "pt vo nghiem"

else
    echo `expr -$2 / $1`
fi

exit 0
