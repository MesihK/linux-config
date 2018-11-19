## General
installing latex: download full image! http://mirrors.rit.edu/CTAN/systems/texlive/Images/
science articles: https://sci-hub.tw/
set default programs: mimeopen -d *.pdf

## I3
if i3 has big fonts it about glx driver. 'xrandr --dpi 96' solves the problem
to be able to use siji font: sudo mv /etc/fonts/conf.d/70-no-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.conf.old
ttf fonts can be used with adding to /usr/share/fonts/truetype/font-name/ & sudo fc-cache -f -v

## Development
caching github passwords: git config --global credential.helper cache
use 'bear' to generate compilation database to use in vim for c, c++ projects
if a file unintentionally added to git 'git rm --cached giant_file; git commit --ammend -CHEAD'
if yocto complains about tmpdir that it has changed location then correct the path in TMPDIR/saved_tmpdir
for kernel development copy ycm_extra_kernel_conf.py to kernel root dir with name: .ycm_extra_conf.py
ccache used like this: CC='ccache gcc'
use gtk-chtheme to change gtk themes
use 'man -k printf(regex)' to search man pages
use 'axel' for fast downloads

## Network 
'nmcli c' list saved wifi connections
'nmcli d wifi list' list current wifi connections
'nmcli c up "SavedWifiName"' connect to wifi
'nmcli d wifi c SSIDNAME password SSIDPASS name SHORTNAME' to connect a wifi
network connections are stored in: /etc/NetworkManager/system-connections

## Mail
to install neomutt you need to compile from source. ./configure --disable-doc --ssl --bdb
use Luke Smith mutt-wizard to setup mutt
offlinemutt -a gmail ile de mailleri indireceksin
mail gonderebilmek icin msmtp programini yukle 'export GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent:0:1' bashrc ye ekle

## PDF
multiple pager per sheet 'pdfnup'
to cropt pdf 'pdfmargin'
to print two sided first 'print odd pages' than 'reverse print even pages'


## Upstreaming
git format-patch -o ../patches/rfc_v1/ --cover-letter -n --thread=shallow -9 --subject-prefix="RFC PATCH v2"

git rebase -i HEAD^^^ || git rebase -i HEAD~3
git add && git commit --amend || git reset HEAD~ & git commit
git rebase --continue

git push origin force

get to and cc addresses from cover patch
use --in-reply-to= swtich for patch series. Old series first message id should be given.
git send-email --to-cover --cc-cover path/to/patch/dir/*.patch
--cc-cmd="scripts/get_maintainer.pl -i --norolestats" to interactively get the maintainers list

Icenowy first patch: 20180119231735.61504-1-icenowy@aosc.io

use --no-signed-off-by-cc to send only yourself
git send-email --to-cmd="~/scripts/to.sh" --cc-cmd="~/scripts/cc.sh" 

## Sync forked repo
git remote add upstream https://github.com/torvalds/linux.git
git fetch upstream
git checkout master
git merge upstream/master
git checkout development
git rebase master

