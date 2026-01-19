#!/usr/bin/env bash

# Get configuration from Home Assistant options file
SESSION_KEY=$(jq -r '.session_key // empty' /data/options.json)
LOG_LEVEL=$(jq -r '.log_level // "info"' /data/options.json)

# Validate required config
if [ -z "$SESSION_KEY" ]; then
    echo "ERROR: Session key is required!"
    exit 1
fi

echo "INFO: Starting AI Server..."
echo "INFO: Log level: ${LOG_LEVEL}"

# Create auth directory
mkdir -p /data/auth

# Write session key to auth directory
printf '%s\n' "${SESSION_KEY}" > /data/auth/codex.json

# Verify the JSON is valid
echo "INFO: Auth file created, verifying JSON format..."
if ! cat /data/auth/codex.json | jq empty 2>/dev/null; then
    echo "WARNING: Auth file may not be valid JSON"
else
    echo "INFO: JSON format verified"
    echo "INFO: Auth file contains keys: $(cat /data/auth/codex.json | jq -r 'keys | join(", ")')"
fi

# Start CLIProxyAPI with config from image
echo "INFO: Starting CLIProxyAPI on port 8787..."
if [ "$LOG_LEVEL" = "debug" ]; then
    exec /app/CLIProxyAPI -config /app/config.yaml -debug
else
    exec /app/CLIProxyAPI -config /app/config.yaml
fi
