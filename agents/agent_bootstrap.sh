#!/bin/bash
set -euo pipefail
echo "[AGENT] Initializing quantum-symbolic cognition unit..."
touch agent_runtime_active.flag
while true; do
  if ! pgrep -f "quantum_symbolic_runtime" >/dev/null; then
    echo "[AGENT] Restarting quantum_symbolic_runtime..."
    bash quantum_symbolic_runtime.sh &
  fi
  sleep 5
done
