
if [ ! -f /tmp/todo.dat ] ; then
    TODOINDEX=2
    echo $TODOINDEX > /tmp/todo.dat
fi

TODOINDEX=$(cat /tmp/todo.dat)
MAX=$(calcurse -t | wc -l)
CNT=$(echo $MAX\-1 | bc)
CUR=$(echo $TODOINDEX\-1 | bc)

echo T$CUR\/$CNT\: $(calcurse -t | awk "NR==$TODOINDEX")
TODOINDEX=$(echo $TODOINDEX\+1 | bc)

if [ $TODOINDEX -gt $MAX ]; then
    TODOINDEX=2
fi

echo $TODOINDEX > /tmp/todo.dat

