# Packer scripts

Scripts to setup an ami via packer.

Installs pip3 thn boto and sh for python3

## Usage

1. Unzip packer to this directory
2. Place validator and data bag scret in ./chef
3. packer build webnode.json

NOTE: Ensure that the proper aws credentials are set in the environment.
