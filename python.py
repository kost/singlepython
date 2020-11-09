#!/usr/bin/env python

import sys

def execpyfile(filename, globals=None, locals=None):
    if globals is None:
        globals = sys._getframe(1).f_globals
    if locals is None:
        locals = sys._getframe(1).f_locals
    with open(filename, "r") as fh:
        exec(fh.read()+"\n", globals, locals)

if __name__ == '__main__':
    if len(sys.argv)<2:
        print("specify script and arguments")
        sys.exit(0)
    execpyfn = sys.argv[1]
    # print(sys.argv)
    # sys.argv[0] = execpyfn
    sys.argv.pop(0) 
    # print(sys.argv)
    execpyfile(execpyfn)
    sys.exit(0)

