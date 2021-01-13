#!/usr/bin/env bash

# TODO: Describe functionality.

# Set strict execution parameters. 
set -e -u -o pipefail

# Defualt binary path.
# Override with flag -d.
BIN_DIR="/usr/local/bin"

# Default installer archive URI.
# Override with flag -a.
BIN_ARCH="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-install-mac.tar.gz"

# Iterate over options for default overrides. 
while getopts d:a: arg
do
  case "${arg}" in
    d) BIN_DIR=${OPTARG};;
    a) BIN_ARCH=${OPTARG}};;
  esac
done


# Download stdout, unpack and make executable
# the latest openshift-install binary.
wget -cO - $BIN_ARCH \
  | tar xz - -C $BIN_DIR \
  | chmod +x $BIN_DIR/openshift-install

# Prove the binary path
printf "Binary directory: $(which openshift-install)\n"

# Prove the updated binary version
printf "$(openshift-install version)"
