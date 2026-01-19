#!/usr/bin/env bashio

# Get configuration from Home Assistant
OPENAI_SESSION_KEY=$(bashio::config 'openai_session_key')
LOG_LEVEL=$(bashio::config 'log_level')

# Validate required config
if [ -z "$OPENAI_SESSION_KEY" ]; then
    bashio::log.error "OpenAI session key is required!"
    exit 1
fi

bashio::log.info "Starting AI Server..."
bashio::log.info "Log level: ${LOG_LEVEL}"

# Create auth directory
mkdir -p /data/auth

# Write session key to auth directory
printf '%s\n' "${OPENAI_SESSION_KEY}" > /data/auth/codex.json

# Verify the JSON is valid
bashio::log.info "Auth file created, verifying JSON format..."
if ! cat /data/auth/codex.json | jq empty 2>/dev/null; then
    bashio::log.warning "Auth file may not be valid JSON"
else
    bashio::log.info "JSON format verified"
    bashio::log.info "Auth file contains keys: $(cat /data/auth/codex.json | jq -r 'keys | join(", ")')"
fi

# Start CLIProxyAPI with config from image
bashio::log.info "Starting CLIProxyAPI on port 8787..."
if [ "$LOG_LEVEL" = "debug" ]; then
    exec /data/CLIProxyAPI -config /data/config.yaml -debug
else
    exec /data/CLIProxyAPI -config /data/config.yaml
fi
