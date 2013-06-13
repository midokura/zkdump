Usage examples
------------
To dump the contents of a zookeeper instance at localhost:2181 to a file called myzkdump.json:
```
zkdump -z localhost:2181 -d -o myzkdump.json
```


To load the contents of a dump file called myzkdump.json into a zookeeper instance at localhost:2181:
```
zkdump -z localhost:2181 -l -i output.json
```

Notes
------------
* Ephemeral nodes are dumped, and are loaded as permanent nodes.
* The /zookeeper tree is not dumped.
* zkdump will ask you to type "confirm" when loading, to ensure you don't accidentally overwrite existing zookeeper data.

Packaging
-------------
To create a .deb package for zkdump, run:
```
./package.sh
```
