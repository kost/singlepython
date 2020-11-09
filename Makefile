.PHONY: all clean impacket deps git copy ipython

IMPACKETDIR=impacket
PYSCRIPT=python.py
HIDDENIMPORTS=$(shell cd $(IMPACKETDIR) && find impacket -iregex '.*py$$' | sed 's%/__init__.py%%g' | sed 's/\.py$$//g' | sed 's%/%.%g' | sed 's%^% --hiddenimport %g' | tr '\n' ' ')

all:

script:
	cd $(IMPACKETDIR) && pyinstaller -F $(HIDDENIMPORTS) --clean $(PYSCRIPT)

git:
	git clone https://github.com/SecureAuthCorp/impacket.git

copy:
	cp $(PYSCRIPT) $(IMPACKETDIR)

impacket:
	cd $(IMPACKETDIR) && pip install .

deps:
	pip install ipython
	pip install pyinstaller==3.4

clean: 
	rm -rf $IMPACKETDIR/dist/* $IMPACKETDIR/build/*

