#!/bin/bash

# Replace environment variables in config
sed -i "s/\${TELEGRAM_BOT_TOKEN}/$TELEGRAM_BOT_TOKEN/g" /root/.openclaw/openclaw.json
sed -i "s/\${GATEWAY_TOKEN}/$GATEWAY_TOKEN/g" /root/.openclaw/openclaw.json

# Copy agent files if they exist
if [ -d "/app/agents" ]; then
  cp -r /app/agents /root/.openclaw/
fi

if [ -d "/app/identity" ]; then
  cp -r /app/identity /root/.openclaw/
fi

# Start OpenClaw
openclawd start
