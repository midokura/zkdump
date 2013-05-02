import zc.zk

zk = zc.zk.ZooKeeper("localhost:2181")

zk.export_tree(ephemeral=True)

f = open("eph","w")
f.write(zk.export_tree(ephemeral=True))
f.close()

g = open("noneph","w")
g.write(zk.export_tree())
g.close()

m optparse import OptionParser
[...]
parser = OptionParser()
parser.add_option("-f", "--file", dest="filename",
                  help="write report to FILE", metavar="FILE")
parser.add_option("-q", "--quiet",
                  action="store_false", dest="verbose", default=True,
                                    help="don't print status messages to stdout")

(options, args) = parser.parse_args()

if __name__ == "__main__":
    parser = OptionParser()
    parser.add_option("-f", "--file", dest="filename",
                      help="write report to FILE", metavar="FILE")
    parser.add_option("-q", "--quiet",
                      action="store_false", dest="verbose", default=True,
                                                          help="don't print status messages to stdout")

    (options, args) = parser.parse_args()
    main()
