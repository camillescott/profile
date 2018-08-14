#!/bin/bash

#
# Usage: tunnel.sh <local_port> <remote_port> <remote_address>
#
while [ 1 ]; do
ssh -N -L localhost:$1:localhost:$2 $3
sleep 5
done
