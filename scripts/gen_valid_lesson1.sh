#!/bin/bash
classes=('cat' 'dog');

rm -rf $1/train $1/valid
unzip -q $1/train.zip -d $1/


valid_split=$2
echo $valid_split
train_data_path=$1/train
valid_data_path=$1/valid

for i in "${classes[@]}"
do
mkdir $train_data_path/$i
mv $train_data_path/$i.*.jpg $train_data_path/$i/
done

mkdir $valid_data_path
for i in "${classes[@]}"
do
mkdir $valid_data_path/$i
validation_files=$(($(ls $train_data_path/$i/ | wc -l) * $valid_split))
echo $validation_files
for file in $(ls $train_data_path/$i/ | sort -R | tail -$((validation_files / 100)))
do
mv  $train_data_path/$i/$file  $valid_data_path/$i/
done
done


exit 0
