#!/bin/bash
export MAXMIND_ACCOUNT_ID=${MAXMIND_ACCOUNT_ID:-""}
export MAXMIND_LICENCEKEY=${MAXMIND_LICENCEKEY:-""}
export MAXMIND_EDITIONS=${MAXMIND_EDITIONS:-"GeoLite2-ASN GeoLite2-City GeoLite2-Country"}

cat <<EOF > /etc/GeoIP.conf
# GeoIP.conf file - used by geoipupdate program to update databases
# from http://www.maxmind.com
AccountID $MAXMIND_ACCOUNT_ID
LicenseKey $MAXMIND_LICENCEKEY
EditionIDs $MAXMIND_EDITIONS
EOF

geoipupdate -v || true

ntopng "$@"

