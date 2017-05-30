#!/bin/bash

valid_split=10

for dir in $(ls train/)
do
no_valid=$(($(ls train/$dir | wc -l) / valid_split))
if [ $no_valid = 0 ]
then
    no_valid=1
fi
for file in $(ls train/$dir | sort -R | head -$no_valid)
do
mv train/$dir/$file valid/$dir/
done
echo $(ls valid/$dir | wc -l)
done

exit 0
