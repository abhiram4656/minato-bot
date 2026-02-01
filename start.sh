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

# Try multiple ways to run openclawd
if command -v openclawd &> /dev/null; then
    echo "Found openclawd in PATH"
    exec openclawd start
elif [ -f "/usr/local/bin/openclawd" ]; then
    echo "Found openclawd in /usr/local/bin"
    exec /usr/local/bin/openclawd start
elif [ -f "/usr/local/lib/node_modules/openclawd/bin/openclawd" ]; then
    echo "Found openclawd in node_modules"
    exec /usr/local/lib/node_modules/openclawd/bin/openclawd start
else
    echo "Trying to run via npx..."
    exec npx openclawd start
fi
