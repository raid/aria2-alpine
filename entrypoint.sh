#!/bin/sh

# Start aria2 with: aria2c --disable-ipv6=true --rpc-allow-origin-all --rpc-listen-all --rpc-listen-port=6800 --rpc-secret=premiumizer --max-connection-per-server=16 --file-allocation=none --disk-cache=0



cat > /etc/aria2.conf <<EOF
log-level=warn
enable-rpc=true
rpc-allow-origin-all=true
rpc-listen-all=true
rpc-secret=premiumizer
dir=${DOWNLOAD_DIR:-/downloads}
log=${DOWNLOAD_DIR:-/downloads}/aria2.log
max-concurrent-downloads=25
max-connection-per-server=16
file-allocation=${FILE_ALLOCATION:-none}
allow-overwrite=${ALLOW_OVERWRITE:-true}
auto-file-renaming=${AUTO_FILE_RENAMING:-false}
disk-cache=0
disable-ipv6=true
rpc-listen-port=6800

EOF

exec "$@"
