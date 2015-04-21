#!/bin/bash

# Useful when connect to remote mac
# will monitor clipboard and send copied data to configured ip/port

IP=$1
PORT=4444
SLEEP_TIME=0.250
MAX_SIZE=10240

old_value=""
while :
do
  current_value=`pbpaste`
  size="${#current_value}"

  if [ $size -lt 10000 ] && [ "$current_value" != "$old_value" ] ; then
    echo "Copying"
    echo "$current_value" | nc $IP $PORT
    echo "copied"
  fi

  old_value=$current_value;
  sleep $SLEEP_TIME;
done
