#!/bin/bash
set -euo pipefail
echo "[SECURITY] Generating NIST PQC Kyber keys..."
mkdir -p keys
if command -v kyber_keygen >/dev/null; then
  kyber_keygen -o keys/public.key -s keys/secret.key
  echo "[SECURITY] Keys generated."
else
  echo "[SECURITY] kyber_keygen not found. Installing kyber-toolset via pip..."
  pip3 install pqcrypto
  python3 - << 'PYCODE'
from pqcrypto.kem.kyber512 import generate_keypair
pk, sk = generate_keypair()
open("keys/public.key","wb").write(pk)
open("keys/secret.key","wb").write(sk)
print("[SECURITY] Kyber keys generated successfully.")
PYCODE
fi
