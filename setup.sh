#!/bin/bash
set -eu

usage() {
cat << _EOF_

USAGE: $0 [options]

Used to setup an ami with python3 and some libraries.
Meant for ubuntu 14.04.

    OPTIONS:
            -h) print this message

_EOF_
}

die() {
  >&2 echo "ERROR: $*"
  exit 1
}

while getopts "h" option; do
  case "$option" in
    h) usage && exit
      ;;
    *) usage && die "Invalid option"
      ;;
  esac
done
shift $((OPTIND-1))
${1+:} false && die "Invalid argument ${1}"

sleep 30

sudo apt-get update -y || die "Could not apt-get update"
sudo apt-get install -y python3-pip || die "Could not apt-get install python3-pip"
sudo pip3 install boto || die "Could not pip3 install boto"
sudo pip3 install sh || die "Could not pip3 install sh"

sudo mv /tmp/chef /etc || die "Could not install chef dir"
