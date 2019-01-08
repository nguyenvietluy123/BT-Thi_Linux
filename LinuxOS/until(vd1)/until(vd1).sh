#!/bin/sh

num=0

until [ $# -eq 0 ]
do
    num=`expr $num + 1`
    echo "The $num argument is $#"
    shift
done
