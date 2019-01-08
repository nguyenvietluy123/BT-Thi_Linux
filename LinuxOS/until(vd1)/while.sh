#!/bin/sh

i=0
s=0

echo "Nhap n = "
read n

while [ $i -lt $n ]
do

    i=`expr $i + 1`
    s=`expr $s + $i`

done

echo "Tong = $s"

exit 0
