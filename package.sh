#!/bin/bash

VERSION=`cat VERSION`

# Common args for rpm and deb
FPM_BASE_ARGS=$(cat <<EOF
--name 'zkdump' --architecture 'noarch' --license '2015, Midokura' \
--vendor 'MidoNet' --maintainer 'MidoNet' --url 'https://midonet.org' \
--description 'Simple zookeeper dump and load script' \
-d 'python' -d 'python-simplejson' \
-s dir -C src --prefix /usr/bin --version $VERSION
EOF
)

# package rpm
eval fpm $FPM_BASE_ARGS -d 'zkpython' --epoch 1 -t rpm .

# package debian
eval fpm $FPM_BASE_ARGS -d 'python-zookeeper' --deb-priority 'optional' -t deb .
