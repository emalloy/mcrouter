#!/usr/bin/env bash

set -ex

[ -n "$1" ] || ( echo "Install dir missing"; exit 1 )

#apt-get update

apt-get install -y \
             git curl autoconf binutils-dev bison cmake libevent-dev libgflags-dev libjemalloc-dev make pkg-config python-dev libgoogle-glog-dev \
                  libssl1.0.0 libssl-dev libatomic1 libatomic1-dbg libatomic-ops-dev libaio1 libaio-dev libdwarf-dev bzip2 liblz4-dev lzma-dev \
                  libboost1.55-dev libboost-all-dev libboost-atomic-dev libunwind-dev libbz2-dev libbz2-1.0 liblzma-dev liblzma5  \
                  libsnappy1 libsnappy-dev libiberty-dev libdouble-conversion{1,-dev}

cd "$(dirname "$0")" || ( echo "cd fail"; exit 1 )

MAKE_ARGS=-j8 PKG_CONFIG_PATH=/usr/local/ssl/lib/pkgconfig:$PKG_CONFIG_PATH ./get_and_build_everything.sh ubuntu-16.04 "$@"

