#!/usr/bin/python
import sys
import zc.zk
from optparse import OptionParser

def confirm_destructive_action(question):
    prompt = "\n[type confirm to proceed, any other key to cancel] "

    sys.stdout.write(question + prompt)
    choice = raw_input().lower()

    return choice == "confirm"

def get_zookeeper(options, args):
  zk = None

  # Try connect to Zookeeper
  try:
    zk = zc.zk.ZooKeeper(options.zklocation)
  except:
    pass

  if zk is None:
    print "Failed to connect to Zookeeper at %s" % (options.zklocation)
    sys.exit(1)
  else:
    print "Connected to Zookeeper at %s" % (options.zklocation)

  return zk

def import_zk(zk, filename):
  f = open(filename,"r")

  current_contents = ", ".join(zk.get_children("/"))
  go_ahead = confirm_destructive_action("Zookeeper currently contains data, with these root nodes: %s\nAre you sure you want to load file contents into Zookeeper? " % current_contents)

  if go_ahead:
    print "Loading data..."
    zk.import_tree(f.read())
    print "Load complete."
  else:
    print "Load cancelled."
  f.close()

def export_zk(zk, filename):
  g = open(filename,"w")
  g.write(zk.export_tree(ephemeral=True))
  g.close()
  print "Successfully dumped to %s" % (filename)

if __name__ == "__main__":
    parser = OptionParser()

    parser.add_option("-z", "--zklocation", action="store", type="string", dest="zklocation",
                      help="Location of zookeeper server in server:port format, e.g. localhost:2181")

    parser.add_option("-d", "--dump", action="store_true", dest="dumpmode", default=False,
                                                          help="Dump from zookeeper")
    parser.add_option("-o", "--outfile", action="store", type="string", dest="outfile",
                      help="Path of the file to write to when dumping data from zookeeper (when using -l option)")
    parser.add_option("-l", "--load", action="store_true", dest="loadmode", default=False,
                                                          help="Load into zookeeper")
    parser.add_option("-i", "--infile", action="store", type="string", dest="infile",
                      help="Path of the file to read from when loading data into zookeeper (when using -l option)")

    (options, args) = parser.parse_args()

    if options.zklocation is None:
      print "Zookeeper location not specified."
      parser.print_help()
      sys.exit(1)

    zk = get_zookeeper(options, args)

    # Check we have a valid mode
    if options.dumpmode and options.outfile is not None and len(options.outfile) > 0:
      export_zk(zk, options.outfile)
    elif options.loadmode and options.infile is not None and len(options.infile) > 0:
      import_zk(zk, options.infile)
    else:
      print "Please run either in dump mode (-d) with an outfile specified (-o) or in load mode (-l) with an infile specified (-i)."
      parser.print_help()
      sys.exit(1)

