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
* The /zookeeper tree is not dumped.
* When exporting, all nodes (including ephemeral nodes) are dumped.
* When loading, zkdump will ask you to type confirmation,
to ensure you don't accidentally overwrite existing zookeeper data.
* When loading, zkdump will also ask you whether you wish to use "restore" mode or
"debug" mode:
 * "restore" mode is standard, and only loads permanent nodes
 * "debug" mode is used for inspecting a snapshot of a Zookeeper
install - it loads ephemeral nodes as permanent nodes

Packaging
-------------
To create a .deb package for zkdump, run:
```
./package.sh
```
