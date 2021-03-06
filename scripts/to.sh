#!/bin/bash

opts="--nogit --nogit-fallback --norolestats --pattern-depth=1 -i"

if [[ $(basename $1) =~ ^0000- ]] ; then
	./scripts/get_maintainer.pl --nom $opts  $(dirname $1)/*
else
	maint=$(./scripts/get_maintainer.pl --nol $opts $1)
if [ "$maint" == "" ] ; then
	echo "linux-kernel@vger.kernel.org"
else
	echo "$maint"
fi
					    fi
