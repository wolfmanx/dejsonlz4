#!/bin/sh

# check.sh - check file_to_mem

# usage: check.sh

# (abbrevx-single-replace "@package@" "::ide::")
# Copyright (C) 2017, Wolfgang Scherer, <Wolfgang.Scherer at gmx.de>
#
# This file is part of @Package@.
#
:  # script help
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# (progn (forward-line 1) (snip-insert "gen_hd-configuration" t t "sh") (insert ""))
## (progn (forward-line 1) (snip-insert "sh_b.prog-path" t t "sh") (insert ""))
## (progn (forward-line 1) (snip-insert "sh_b.config.sh" t t "sh") (insert ""))

# --------------------------------------------------
# |||:sec:||| FUNCTIONS
# --------------------------------------------------

usage ()
{
    script_help="script-help"
    ( "${script_help}" ${1+"$@"} "${prog_path-${0}}" ) 2>/dev/null \
    || ${SED__PROG-sed} -n '3,/^[^#]/{;/^[^#]/d;p;}' "${prog_path-${0}}";
}

## (progn (forward-line 1) (snip-insert "sh_f.hl" t t "sh") (insert ""))
## (progn (forward-line 1) (snip-insert "sh_f.vexec" t t "sh") (insert ""))
## (progn (forward-line 1) (snip-insert "sh_wsrfid.f.config_dump" t t "sh") (insert ""))
## (progn (forward-line 1) (snip-insert "sh_scr.sh" t t "sh") (insert "\n"))
## (progn (forward-line 1) (snip-insert "sh.scr.sed" t t "sh") (insert "\n"))
## (progn (forward-line 1) (snip-insert "sh.scr.awk" t t "sh") (insert "\n"))
## (progn (forward-line 1) (snip-insert "sh.scr.perl" t t "sh") (insert "\n"))
## (progn (forward-line 1) (snip-insert "sh.scr.python" t t "sh") (insert "\n"))

# (progn (forward-line 1) (snip-insert "sh_b.opt-loop" t t "sh") (insert "\n"))
test x"${1+set}" != xset || \
case "${1}" in
-\?|-h|--help) usage; exit 0;;
--docu) usage --full; exit 0;;
esac

# --------------------------------------------------
# |||:sec:||| MAIN
# --------------------------------------------------

test_file='test_file.tst'
dejsonlz4='dejsonlz4'
jsonlz4='ref_compress/jsonlz4'

export JSONLZ4_DEBUG=1

# |:here:|

## (progn (forward-line 1) (snip-insert-mode "sh.b.wrf.loop" t t) (insert "\n"))

if test -r Makefile
then
    make || exit 1
    printf "%s\n" '--------------------------------------------------'
fi

for xfile in "${dejsonlz4}" "${jsonlz4}"
do
    if test ! -x "${xfile}"
    then
	printf >&2 "missing executable \`%s\`\n" "${xfile}"
	exit 1
    fi
done

set -e

gen_data ()
{
python -c '
import sys
import random
random.seed()
size = int(sys.argv[1])
for _i in xrange(size):
    sys.stdout.write(chr(random.randint(0,255)))
' ${1+"$@"}
}

test_run ()
{
size="${1}"
test_file="test_file_${size}.tst"
gen_data "${size}" >"${test_file}"
cat "${test_file}" | "${jsonlz4}" - - >"${test_file}.jsonlz4"
cat "${test_file}.jsonlz4" | "${dejsonlz4}" - >"${test_file}.t"
if cmp "${test_file}" "${test_file}.t"
then
    printf "%-4s (%d)\n" "GOOD" "${size}"
    rm -f "${test_file}"*
else
    printf "%-4s (%d)\n" "BAD" "${size}"
fi
}

# count just below BUF_ALLOC_MIN
test_run 32768

# count just above BUF_ALLOC_MIN
test_run 32769

# count just above BUF_ALLOC_MIN * 2 ^ 3 + 1
test_run 262145

exit # |||:here:|||

#
# :ide-menu: Emacs IDE Main Menu - Buffer @BUFFER@
# . M-x `eIDE-menu' (eIDE-menu "z")

# :ide: OCCUR-OUTLINE: Sections: `||: sec :||'
# . (x-symbol-tag-occur-outline "sec" '("||:" ":||") '("|:" ":|"))

# :ide: MENU-OUTLINE:  Sections `||: sec :||'
# . (x-eIDE-menu-outline "sec" '("||:" ":||") '("|:" ":|"))

# :ide: +-#+
# . Buffer Outline Sections ()

# :ide: SHELL: Run with --docu
# . (progn (save-buffer) (shell-command (concat "sh " (file-name-nondirectory (buffer-file-name)) " --docu")))

# :ide: SHELL: Run with --help
# . (progn (save-buffer) (shell-command (concat "sh " (file-name-nondirectory (buffer-file-name)) " --help")))

# :ide: SHELL: Run w/o args
# . (progn (save-buffer) (shell-command (concat "sh " (file-name-nondirectory (buffer-file-name)) " ")))

#
# Local Variables:
# mode: sh
# comment-start: "#"
# comment-start-skip: "#+"
# comment-column: 0
# End:
# mmm-classes: (here-doc ide-entries)
