#/bin/bash

# This program should compile paper.tex, a tex file assumed to be in
# the current/working directory.  And it should tar-gzip the entire
# current directory (from the current directory) to a tgz file called
# paper.tgz.  It should then move the paper.tgz file to /tmp.

#compile
latex -interaction=batchmode paper.tex>&/dev/null

#
tar -cvzf paper.tgz .>&/dev/null

#move to /tmp
mv paper.tgz /tmp/

