# https://openexchangerates.org/api/latest.json?app_id=32fc350087e34f3797d96e5aad5ac99d&base=USD

wget https://altin.in/fiyat/22-ayar-bilezik -O /tmp/fin.dat > /dev/null 2>&1

#if file is empty then exit
if [ ! -s /tmp/fin.dat ]; then
    echo err!
    exit 0
fi

USD=$(cat /tmp/fin.dat | grep --binary-files=text USD | grep --binary-files=text -oP dfiy\'\>[0-9]\.[0-9]+ | grep --binary-files=text -oP [0-9]\.[0-9]+ | cut -c -4)
GOLD=$(cat /tmp/fin.dat | grep --binary-files=text -P "22 Ayar Bilezik - Sat" | grep --binary-files=text -oP [0-9]+\.[0-9]+ | cut -c -6)
echo $USD\$ $GOLD\G


