#!/bin/sh

#gebze
#http://namazvakitleri.diyanet.gov.tr/tr-TR/9651/
#http://namazvakitleri.diyanet.gov.tr/en-US/9651/

LOCATION=9651
DATE="$(date +%d.%m.%Y)"
FILE=~/scripts/$LOCATION.dat
TIME="$(date +%H:%M)"

if [ ! -f $FILE ] 
then
    wget http://namazvakitleri.diyanet.gov.tr/en-US/$LOCATION -O $FILE
fi
cat $FILE | grep -m1 -A 6 $DATE | grep -oP [0-9]+:[0-9]+  > /tmp/namaz.dat

