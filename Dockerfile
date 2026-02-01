# Use official Node.js runtime with version 22 (OpenClaw requires 22+)
FROM node:22

# Set working directory
WORKDIR /app

# Install OpenClaw globally via npm
RUN npm install -g openclawd@latest

# Verify installation and find the binary
RUN which openclawd || find /usr -name openclawd || npm list -g openclawd

# Create openclaw directory
RUN mkdir -p /root/.openclaw

# Copy configuration files
COPY openclaw.json /root/.openclaw/openclaw.json
COPY start.sh /app/start.sh

# Copy agent workspace files (excluding sensitive auth files)
COPY agents /root/.openclaw/agents
COPY identity/device.json /root/.openclaw/identity/device.json

# Create directories for auth files (will be populated from env vars)
RUN mkdir -p /root/.openclaw/agents/main/agent
RUN mkdir -p /root/.openclaw/identity

# Make start script executable
RUN chmod +x /app/start.sh

# Expose gateway port
EXPOSE 18789

# Start OpenClaw
CMD ["/app/start.sh"]
