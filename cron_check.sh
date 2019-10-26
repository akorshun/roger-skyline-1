cat /etc/crontab > /home/mkeel/checksum
CHECKSUM=/home/mkeel/checksum
TEMP=/home/mkeel/temp
DIFF=$(diff $CHECKSUM $TEMP)
if [ ! -f $TEMP ]; then
    cat $CHECKSUM > $TEMP
    exit 0;
fi;
if [ "$DIFF" != "" ]; then
    echo “Crontab was modified !!!” | mail -s “Changing crontab !!!” root
    sudo rm -rf $TEMP
    cat $CHECKSUM > $TEMP
fi;
