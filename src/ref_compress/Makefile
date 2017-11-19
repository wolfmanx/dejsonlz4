# -*- makefile -*-

top_srcdir = .
srcdir = .
bindir = /usr/local/bin

EXTRA_DIST = jsonlz4

CLEANFILES =
CLEANFILES += *.o

DISTFILES =
DISTFILES += Makefile
DISTFILES += $(EXTRA_DIST)

CC = gcc
CFLAGS = -Wall

default: all

jsonlz4: jsonlz4.o ../lz4.o

all: $(DISTFILES) all-local

all-local:

clean:
	test -z '$(CLEANFILES)' || rm -rf $(CLEANFILES)

install: all
	mkdir -p $(bindir)
	cp -p jsonlz4 $(bindir)/

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
