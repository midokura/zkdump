# Get version number from command line
pkgver=$1
if [ '$pkgver' == '' ]
then
	echo "Please specify the package version, e.g. 'package.sh 1.04' to package as version 1.04"
	exit
else
    echo "Packaging with version number $pkgver"
fi

# Common args for rpm and deb
FPM_BASE_ARGS=$(cat <<EOF
--name 'zkdump' --architecture 'noarch' --license '2013, Midokura' \
--vendor 'Midokura' --maintainer 'Midokura' --url 'http://midokura.com' \
--description 'Simple zookeeper dump and load script' \
-d 'python' -d 'python-simplejson' \
-s dir -C src --prefix /usr/bin --version $pkgver
EOF
)

# package rpm
eval fpm $FPM_BASE_ARGS -d 'zkpython' --epoch 1 -t rpm .

# package debian
eval fpm $FPM_BASE_ARGS -d 'python-zookeeper' --deb-priority 'optional' -t deb .
