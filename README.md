ZkDump
======

A tool to export the contents of a ZooKeeper ensemble.

WARNING: Do not use for backups.  This tool is intended only for
diagnostic purposes, and cannot be used to back up and restore a
ZooKeeper database due to the fact that it does not restore sequential
node counters to their pre-dump values.  See the official ZooKeeper
documentation for proper backup and restore procedures.

Usage
-----

To dump the contents of a ZooKeeper instance at localhost:2181 to a file
called myzkdump.json:

    zkdump -z localhost:2181 -d -o myzkdump.json

To load the contents of a dump file called myzkdump.json into a
ZooKeeper instance at localhost:2181:

    zkdump -z localhost:2181 -l -i output.json

Notes

* The /zookeeper tree is not dumped.
* When exporting, all nodes (including ephemeral nodes) are dumped.
* When loading, zkdump will ask you to type confirmation, to ensure you
  don't accidentally overwrite existing ZooKeeper data.
* When loading, zkdump will also ask you whether you wish to use
  "restore" mode or "debug" mode:
 * "restore" mode is standard, and only loads permanent nodes
 * "debug" mode is used for inspecting a snapshot of a ZooKeeper install
   - it loads ephemeral nodes as permanent nodes

Packaging
---------

Debian and RHEL packages can be created using:

    ./package.sh
