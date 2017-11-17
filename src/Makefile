# -*- makefile -*-

top_srcdir = .
srcdir = .
bindir = /usr/local/bin

EXTRA_DIST = dejsonlz4

CLEANFILES =
CLEANFILES += *.o

DISTFILES =
DISTFILES += Makefile
DISTFILES += $(EXTRA_DIST)

default: all

dejsonlz4: dejsonlz4.o lz4.o

all: $(DISTFILES) all-local all-recursive

all-recursive:
	( cd ref_compress && $(MAKE) all )

all-local:

clean-recursive:
	( cd ref_compress && $(MAKE) clean )

clean-local:
	test -z '$(CLEANFILES)' || rm -rf $(CLEANFILES)

clean: clean-local clean-recursive

install-recursive:
	( cd ref_compress && $(MAKE) install )

install-local:
	mkdir -p $(bindir)
	cp -p dejsonlz4 $(bindir)/

install: all install-local install-recursive

dist:

tags-rc:
	gen_tags.sh --template
tags:
	gen_tags.sh --force

# |:here:|
# :ide-menu: Emacs IDE Main Menu - Buffer @BUFFER@
# . M-x `eIDE-menu' ()(eIDE-menu "z")

# :ide: COMPILE: tags
# . (let ((args "tags")) (compile (concat "make -k " args)))

# :ide: COMPILE: dist
# . (let ((args "dist")) (compile (concat "make -k " args)))

# :ide: COMPILE: install
# . (let ((args "install")) (compile (concat "make -k " args)))

# :ide: COMPILE: clean
# . (let ((args "clean")) (compile (concat "make -k " args)))

# :ide: COMPILE: Standard
# . (let ((args "")) (compile (concat "make -k " args)))
#
# Local Variables:
# mode: makefile
# snip-mode: makefile-gmake
# truncate-lines: t
# End:
