# Use Node.js LTS
FROM node:20-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install OpenClaw globally
RUN npm install -g openclawd

# Create openclaw directory
RUN mkdir -p /root/.openclaw

# Copy configuration files
COPY openclaw.json /root/.openclaw/openclaw.json
COPY start.sh /app/start.sh

# Copy agent workspace files
COPY agents /root/.openclaw/agents
COPY identity /root/.openclaw/identity

# Make start script executable
RUN chmod +x /app/start.sh

# Expose gateway port
EXPOSE 18789

# Start OpenClaw
CMD ["/app/start.sh"]
