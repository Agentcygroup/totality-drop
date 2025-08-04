#!/bin/bash
set -euo pipefail
echo "[IPFS] Publishing TOTALITY to IPFS..."
CID=$(ipfs add -r "/Volumes/AXSWARM_SSD/TOTALITY_SUPERCLOSURE" | tail -n1 | awk '{print $2}')
echo "[IPFS] CID: $CID"
echo "$CID" > "/Volumes/AXSWARM_SSD/TOTALITY_PACKAGE_SUPER/TOTALITY_CID.txt"
