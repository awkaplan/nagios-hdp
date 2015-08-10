#!/bin/sh

problemStrings="inconsistent|corrupt|failed|exception"

count=$(/usr/bin/hbase hbck | grep -Ei -c "$problemStrings")

if [ $count -eq 0 ]; then
    echo "OK: HBase is in a consistent state."
    exit 0
else
    echo "CRITICAL: HBase is in an inconsistent state.  Please run hbck for more details."
    exit 2
fi
