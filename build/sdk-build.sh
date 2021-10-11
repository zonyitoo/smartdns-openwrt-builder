#!/bin/bash

cd /home/build/openwrt

ls -alh ./bin

echo 'BUILD START'

make defconfig
if [[ "$?" != "0" ]]; then
    exit $?
fi

./scripts/feeds update && ./scripts/feeds install libpthread libopenssl
if [[ "$?" != "0" ]]; then
    exit $?
fi

make package/smartdns/compile V=s
if [[ "$?" != "0" ]]; then
    exit $?
fi
