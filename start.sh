#!/bin/bash

# Replace environment variables in config
sed -i "s/\${TELEGRAM_BOT_TOKEN}/$TELEGRAM_BOT_TOKEN/g" /root/.openclaw/openclaw.json
sed -i "s/\${GATEWAY_TOKEN}/$GATEWAY_TOKEN/g" /root/.openclaw/openclaw.json

# Create auth-profiles.json from environment variable if provided
if [ ! -z "$AUTH_PROFILES_JSON" ]; then
  echo "$AUTH_PROFILES_JSON" > /root/.openclaw/agents/main/agent/auth-profiles.json
fi

# Create device-auth.json from environment variable if provided
if [ ! -z "$DEVICE_AUTH_JSON" ]; then
  echo "$DEVICE_AUTH_JSON" > /root/.openclaw/identity/device-auth.json
fi

# Find and run openclawd
if command -v openclawd &> /dev/null; then
    openclawd start
elif [ -f "/root/.openclaw/bin/openclawd" ]; then
    /root/.openclaw/bin/openclawd start
elif [ -f "/usr/local/bin/openclawd" ]; then
    /usr/local/bin/openclawd start
else
    echo "Error: openclawd not found"
    exit 1
fi
