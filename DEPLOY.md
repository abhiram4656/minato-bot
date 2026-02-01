# Railway Deployment Guide

## Step 1: Create GitHub Repo

1. Go to github.com and create a **private** repository (name it `openclaw-bot`)
2. Initialize git in this folder:

```bash
cd openclaw-deploy
git init
git add .
git commit -m "Initial OpenClaw setup"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/openclaw-bot.git
git push -u origin main
```

## Step 2: Deploy on Railway

1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub (no credit card needed)
3. Click "New Project" → "Deploy from GitHub repo"
4. Select your `openclaw-bot` repo
5. Railway will auto-detect the Dockerfile and deploy

## Step 3: Add Environment Variables

In Railway dashboard, go to your project → Variables tab and add:

```
TELEGRAM_BOT_TOKEN=8561786813:AAHNHK35QzRx4WG_76OP49CUDOkT0z5nD1E
GATEWAY_TOKEN=89b9e9cd4967519f57912ca43fb189be02dafafad45eba0c
```

## Step 4: Redeploy

After adding variables, click "Deploy" again. Your bot will start!

## Testing

Message your Telegram bot. It should respond within seconds.

## Monitoring

- Check logs in Railway dashboard
- Your bot runs 24/7 on Railway's servers
- $5 free credit should last the whole month

## Troubleshooting

If bot doesn't respond:

1. Check Railway logs for errors
2. Verify environment variables are set
3. Make sure Telegram bot token is correct
4. Check if Google Antigravity auth is working

## Cost

- Railway: $5 free credit/month (should be enough)
- Google Antigravity: Free AI models
- Total: $0/month if you stay within free tier
