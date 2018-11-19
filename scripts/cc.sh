#!/bin/bash

opts="--norolestats -i"

if [[ $(basename $1) =~ ^0000- ]] ; then
	./scripts/get_maintainer.pl --nom $opts  $(dirname $1)/*
else
	./scripts/get_maintainer.pl $opts $1
fi
