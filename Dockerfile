# Use official Node.js runtime
FROM node:20

# Set working directory
WORKDIR /app

# Install OpenClaw using the official installer
RUN curl -fsSL https://openclaw.ai/install.sh | bash

# Add openclaw to PATH
ENV PATH="/root/.openclaw/bin:${PATH}"

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
