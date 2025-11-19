# 🆓 FREE Deployment Guide - Zero Cost Option

This guide will help you deploy your entire Complaint Analyzer project for **$0/month**.

## 🏗️ Free Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   AWS Amplify   │────│   Render.com    │────│  MongoDB Atlas  │
│   (Frontend)    │    │   (Backend)     │    │  (Database)     │
│   FREE Tier     │    │   FREE Tier      │    │   FREE Tier     │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

## 💰 Cost Breakdown

| Service | Cost | Limitations |
|---------|------|-------------|
| **AWS Amplify Frontend** | $0 | 1,000 build minutes/month |
| **Render.com Backend** | $0 | Sleeps after 15 min inactivity |
| **MongoDB Atlas** | $0 | 512MB storage |
| **Total** | **$0** | Perfect for development/demo |

---

## 🚀 Step-by-Step FREE Deployment

### Step 1: Backend Deployment to Render.com (5 minutes)

#### 1.1 Go to Render.com
1. Open https://render.com/
2. Click **"Get Started for Free"**
3. Sign up with **GitHub** (easiest)
4. Authorize Render to access your repositories

#### 1.2 Create Backend Service
1. Click **"New +"** button (top right)
2. Select **"Web Service"**
3. Find and select your repository: **`tajinder23127/CollegeProject`**

#### 1.3 Configure Backend Service
Fill in these settings:

- **Name**: `complaint-analyzer-backend`
- **Root Directory**: `backend`
- **Region**: Oregon (US West) or closest to you
- **Branch**: `main`
- **Runtime**: `Python 3`
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn --bind 0.0.0.0:$PORT app:app`
- **Instance Type**: **Free**

#### 1.4 Add Environment Variables
Click **"Advanced"** → **"Add Environment Variable"**

Add these variables:

| Key | Value |
|-----|-------|
| `MONGODB_USERNAME` | `dhillon2317` |
| `MONGODB_PASSWORD` | `dhillon1000` |
| `MONGODB_CLUSTER` | `cluster0.6ebj5lk.mongodb.net` |
| `FLASK_ENV` | `production` |
| `ALLOWED_ORIGINS` | `https://main.d1nokap2upnclw.amplifyapp.com,http://localhost:5173` |

#### 1.5 Deploy Backend
1. Click **"Create Web Service"**
2. Wait 5-10 minutes for deployment
3. Watch the logs - you should see:
   ```
   All models loaded successfully
   Connected to MongoDB successfully!
   ```
4. Once deployed, you'll see: **"Your service is live 🎉"**

#### 1.6 Copy Your Backend URL
- Look for the URL at the top: `https://complaint-analyzer-backend.onrender.com`
- **COPY THIS URL** - you'll need it next

---

### Step 2: Update Frontend Configuration

#### Option A: Update in Amplify Console (Easiest)

1. Go to https://console.aws.amazon.com/amplify/
2. Select your app: `complain-analyzer-ai`
3. Click **"Environment variables"** in left sidebar
4. Click **"Manage variables"**
5. Add new variable:
   - **Variable name**: `VITE_API_URL`
   - **Value**: `https://complaint-analyzer-backend.onrender.com/api`
     (Replace with YOUR Render URL)
6. Click **"Save"**
7. Go to **"Rewrites and redirects"**
8. Click **"Redeploy this version"**

#### Option B: Update Code and Push (Alternative)

1. Edit `.env.production` file:
   ```bash
   cd frontend/complain-analyzer-ai
   ```
   
2. Update the file:
   ```
   VITE_API_URL=https://complaint-analyzer-backend.onrender.com/api
   ```
   (Replace with YOUR Render URL)

3. Commit and push:
   ```bash
   git add .
   git commit -m "Update production API URL"
   git push origin main
   ```

4. Amplify will auto-rebuild (takes 2-3 minutes)

---

### Step 3: Deploy ML Analysis Backend (Optional)

#### 3.1 Create ML Backend Service
1. Go back to Render.com
2. Click **"New +"** → **"Web Service"**
3. Select the same repository
4. Configure:
   - **Name**: `ml-analysis-backend`
   - **Root Directory**: `sbackend/camplaint-analyzer`
   - **Runtime**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn --bind 0.0.0.0:$PORT app:app`
   - **Instance Type**: **Free**

#### 3.2 Add Environment Variables for ML Backend
| Key | Value |
|-----|-------|
| `FLASK_ENV` | `production` |

#### 3.3 Deploy ML Backend
1. Click **"Create Web Service"**
2. Wait for deployment
3. Copy the ML backend URL

---

### Step 4: Test Your FREE Deployment

#### 4.1 Test Backend Directly
Open in browser: `https://your-backend-url.onrender.com/api/complaints`

Should see JSON response:
```json
{
  "success": true,
  "data": [...]
}
```

#### 4.2 Test Frontend
1. Go to: https://main.d1nokap2upnclw.amplifyapp.com
2. Click **"Submit"** tab
3. Fill in a complaint
4. Click **"Submit Complaint"**
5. Should see success message!
6. Go to **"Dashboard"** - your complaint should appear!

---

## 🎯 Important Notes About FREE Tier

### Render.com Limitations
- **Sleeps after 15 minutes** of inactivity
- **First request after sleep** takes 30-60 seconds
- **No custom domains** on free tier
- **Limited to 750 hours/month** (enough for full-time use)

### AWS Amplify Limitations
- **1,000 build minutes/month** (plenty for development)
- **Unlimited hosting** for static sites
- **Custom domains** supported

### MongoDB Atlas Limitations
- **512MB storage** (enough for thousands of complaints)
- **Shared cluster** (slower but functional)
- **No automatic backups** on free tier

---

## 🔧 Troubleshooting

### Backend shows "Service Unavailable"
- Check Render logs for errors
- Verify MongoDB connection
- Wait a few more minutes (first deploy can be slow)

### Frontend still says "localhost"
- Clear browser cache (Ctrl + Shift + R)
- Check Amplify environment variables
- Verify Amplify rebuild completed

### CORS Error
Backend needs to allow your Amplify URL. Check that `ALLOWED_ORIGINS` includes your Amplify URL.

### Render Free Tier Sleeps
- This is normal behavior
- First request after sleep takes 30-60 seconds
- Upgrade to paid ($7/month) for always-on if needed

---

## 🎉 Current URLs After Deployment

- **Frontend (Amplify)**: https://main.d1nokap2upnclw.amplifyapp.com
- **Backend (Render)**: `https://complaint-analyzer-backend.onrender.com` (after deployment)
- **ML Backend (Render)**: `https://ml-analysis-backend.onrender.com` (optional)
- **MongoDB**: cluster0.6ebj5lk.mongodb.net (already working)

---

## 🚀 Ready to Start?

**Step 1**: Go to https://render.com/ and deploy your backend now!

The entire process should take **10-15 minutes** and cost **$0**.

---

## 🆘 Need Help?

If you get stuck:
1. Check Render deployment logs
2. Check Amplify build logs
3. Check browser console (F12) for errors
4. Let me know the error message

**Ready? Go to https://render.com/ and start deploying!** 🚀
