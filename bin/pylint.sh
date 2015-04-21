#! /bin/sh

unset LC_CTYPE
source ~/Projects/jusbrasil-webpy/osxenv/bin/activate;  ~/Projects/jusbrasil-webpy/osxenv/bin/pylint "$@"
