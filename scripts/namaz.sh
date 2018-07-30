#!/bin/sh

#gebze
#http://namazvakitleri.diyanet.gov.tr/tr-TR/9651/
#http://namazvakitleri.diyanet.gov.tr/en-US/9651/

minutes () {
    HOUR=$(echo $1 | cut -c -2)
    MIN=$(echo $1 | cut -c 4-)
    echo $(echo $HOUR\*60\+$MIN | bc)
}

todate () {
    HOUR=$(echo $1\/60 | bc)
    MIN=$(echo $1\-$HOUR\*60 | bc)
    echo $HOUR:$MIN
}

printname () {
    if [ $1 = "1" ]; then
        echo "imsak"
    elif [ $1 = "2" ]; then
        echo "gunes"
    elif [ $1 = "3" ]; then
        echo "ogle"
    elif [ $1 = "4" ]; then
        echo "ikindi"
    elif [ $1 = "5" ]; then
        echo "aksam"
    else
        echo "yatsi"
    fi
}

#gebze=9651
LOCATION=9651
DATE="$(date +%d.%m.%Y)"
TOMORROW=$(date -d tomorrow +%d.%m.%Y)
FILE=~/scripts/$LOCATION.dat
TIME=$(minutes $(date +%H:%M))

if [ ! -f $FILE ] 
then
    wget http://namazvakitleri.diyanet.gov.tr/en-US/$LOCATION -O $FILE
fi
#cat $FILE | grep -m1 -A 6 $DATE | grep -oP [0-9]+:[0-9]+  > /tmp/namaz.dat
cat $FILE | grep -m1 -A 6 $TOMORROW > /dev/null 
if [ $? -eq 1 ]
then
    #echo data is old!
    wget http://namazvakitleri.diyanet.gov.tr/en-US/$LOCATION -O $FILE
    exit 0
fi
CNT=0
cat $FILE | grep -m1 -A 6 $DATE | grep -oP [0-9]+:[0-9]+ | while read -r line ; do
    CNT=$(echo $CNT\+1 | bc)
    Tline=$(minutes $line)
    if [ $(minutes $line) -gt $TIME ]
    then
        RES=$(echo $Tline \- $TIME | bc)
        
        echo $(printname $CNT) $(todate $RES)
        exit 0
    fi
done

#couldn't find right prayer time
CNT=1
DATE=$(date -d tomorrow +%d.%m.%Y)
#get first time
Tline=$(minutes $(cat $FILE | grep -m1 -A 1 $DATE | grep -oP [0-9]+:[0-9]+))
RES=$(echo 24\*60\-$TIME\+$Tline | bc)
echo $(printname $CNT) $(todate $RES)


