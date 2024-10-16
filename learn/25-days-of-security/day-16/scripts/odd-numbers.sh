#!/bin/bash

for i in {1..100}
do
    if [ $(($i % 2)) -eq 1 ]
    then
        echo "Odd number: $i"
        result=$(curl --silent "http://10.10.145.235/api/$i")
        echo $result | jq
    fi
done