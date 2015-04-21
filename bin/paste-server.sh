#!/bin/bash

# Listen on the configured port and copy the content sent

PORT=4444

while :
do
  nc -l $PORT | pbcopy
  echo "pasted"
done
