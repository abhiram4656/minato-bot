# OpenClaw Railway Deployment

Deploy your OpenClaw bot to Railway for 24/7 uptime.

## Setup Steps

1. **Copy your config**: Copy `openclaw.json` from `C:\Users\abhi7\.openclaw\openclaw.json` to this folder
2. **Remove sensitive data**: Edit `openclaw.json` and replace API keys with environment variables
3. **Push to GitHub**: Create a new private repo and push this folder
4. **Deploy on Railway**:
   - Sign up at railway.app with GitHub
   - Create new project
   - Connect your GitHub repo
   - Add environment variables for API keys
   - Deploy!

## Environment Variables

Add these in Railway dashboard:

- `ANTHROPIC_API_KEY` - Your Claude API key
- `TELEGRAM_BOT_TOKEN` - Your Telegram bot token (if using)
- Any other API keys from your config

## Cost

Railway gives $5 free credit monthly. OpenClaw should use ~$2-3/month for hosting.
