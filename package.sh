# move file
rm -f packaging/usr/bin/*
cp src/* packaging/usr/bin/

# package
dpkg-deb --build packaging .

