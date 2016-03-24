#!/bin/sh

echo "Running confd bootstrap"
/bin/confd -onetime -backend rancher -prefix /2015-07-25 -confdir /etc/confd/bootstrap/

echo "Bootstrap complete"
echo "Starting confd"
/bin/confd -backend rancher -prefix /2015-07-25
