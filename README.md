# singlepython
Building Python interpreter as Single Fat Binary.

Grab binaries on releases pages:
https://github.com/kost/singlepython/releases

## Problem

Environment that either doesn't have Python or you don't want to disturb any existing python packages. One of the examples is running impacket binaries on such hosts.

## Solution

Use pyinstaller to wrap single python script. Wrapping single python script which will act as executable and execute other script. Add impacket as hidden dependency.
Find as old glibc distribution as you can (in my case: Debian lenny is quite good option) and use these scripts to packet the binaries and scripts..

## Troubleshooting

Q: i cannot write to /tmp.

A: Use TMPDIR to point where you have write access to: ```TMPD_DIR ./python psexec.py```


Q: why not just statically compile python?

A: while Python has support for static compiling, getting every depedency with pip to play well is another story...

## References
  - https://github.com/ropnop/impacket_static_binaries - other approach where each binary is different executable


