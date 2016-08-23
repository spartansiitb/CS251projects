#!/bin/bash

while read p ;do 
yes|unzip -q -o -P $p legendaryPokemon.zip > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo $p
fi
done < dictionary.txt