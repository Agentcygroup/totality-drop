#!/bin/bash
set -euo pipefail
echo "[SWARM] Monitoring and healing runtime agents..."
while true; do
  if ! pgrep -f "agent_bootstrap.sh" >/dev/null; then
    echo "[SWARM] agent_bootstrap.sh not running; restarting..."
    bash "$ROOT/agents/agent_bootstrap.sh" &
  fi
  sleep 10
done
