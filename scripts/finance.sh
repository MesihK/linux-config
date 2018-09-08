# https://openexchangerates.org/api/latest.json?app_id=32fc350087e34f3797d96e5aad5ac99d&base=USD

#wget https://altin.in/fiyat/22-ayar-bilezik -O /tmp/fin.dat > /dev/null 2>&1
wget https://www.kuveytturk.com.tr/finans-portali/ -O /tmp/fin.dat > /dev/null 2>&1

#if file is empty then exit
if [ ! -s /tmp/fin.dat ]; then
    echo err!
    exit 0
fi

#USD satis
#USD=$(cat /tmp/fin.dat | grep --binary-files=text USD | grep --binary-files=text -oP dfiy\'\>[0-9]\.[0-9]+ | grep --binary-files=text -oP [0-9]\.[0-9]+ | cut -c -4)

#22 ayar satis
#GOLD=$(cat /tmp/fin.dat | grep --binary-files=text -P "22 Ayar Bilezik - Sat" | grep --binary-files=text -oP [0-9]+\.[0-9]+ | cut -c -6)

#USD satis
USD=$(cat /tmp/fin.dat | grep -m 1 -A 11 '<h2>USD' |  grep -oP [0-9]+\.[0-9]+ | sed '2q;d' | cut -c -4)
USD=$(echo $USD | sed 's|,|\.|g')

#24 ayar alis
GOLD=$(cat /tmp/fin.dat | grep -m 1 -A 7 ALT | grep -oP [0-9]+\.[0-9]+ | cut -c -6)
GOLD=$(echo $GOLD | sed 's|,|\.|g' )

GOLD2=$(cat /tmp/fin.dat | grep -m 1 -A 14 ALT | grep -oP  [0-9]+\.[0-9]+ | sed '2q;d' | cut -c -6)
GOLD2=$(echo $GOLD2 | sed 's|,|\.|g' )

#total
TOT=$(echo $GOLD\*36.76 | bc )

#echo $USD\$ $GOLD\G $TOT
echo $USD\$ $GOLD\-$GOLD2\G


