# 🚀 Deploy Both Backends to Render.com

This guide shows you how to deploy BOTH backends for $0/month.

## 📋 Overview

You have **2 backends** to deploy:

1. **Main Backend** (`backend/`) - Handles authentication, complaints, API
2. **ML Analysis Backend** (`sbackend/camplaint-analyzer/`) - Handles AI analysis

## 🎯 Deployment Steps

### Step 1: Deploy Main Backend

#### 1.1 Go to Render.com
1. Open https://render.com/
2. Sign up/login with GitHub
3. Click **"New +"** → **"Web Service"**

#### 1.2 Configure Main Backend
- **Repository**: `tajinder23127/CollegeProject`
- **Root Directory**: `backend`
- **Name**: `complaint-analyzer-backend`
- **Runtime**: `Python 3`
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn --bind 0.0.0.0:$PORT app:app`
- **Instance Type**: **Free**

#### 1.3 Environment Variables for Main Backend
Add these 5 variables:

| Key | Value |
|-----|-------|
| `MONGODB_USERNAME` | `dhillon2317` |
| `MONGODB_PASSWORD` | `dhillon1000` |
| `MONGODB_CLUSTER` | `cluster0.6ebj5lk.mongodb.net` |
| `FLASK_ENV` | `production` |
| `ALLOWED_ORIGINS` | `https://main.d1nokap2upnclw.amplifyapp.com,http://localhost:5173` |

#### 1.4 Deploy
1. Click **"Create Web Service"**
2. Wait 5-10 minutes
3. Copy the URL: `https://complaint-analyzer-backend.onrender.com`

---

### Step 2: Deploy ML Analysis Backend

#### 2.1 Create Second Web Service
1. Go back to Render.com dashboard
2. Click **"New +"** → **"Web Service"**
3. Select the same repository: `tajinder23127/CollegeProject`

#### 2.2 Configure ML Backend
- **Root Directory**: `sbackend/camplaint-analyzer`
- **Name**: `ml-analysis-backend`
- **Runtime**: `Python 3`
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn --bind 0.0.0.0:$PORT app:app`
- **Instance Type**: **Free**

#### 2.3 Environment Variables for ML Backend
Add just 1 variable:

| Key | Value |
|-----|-------|
| `FLASK_ENV` | `production` |

#### 2.4 Deploy ML Backend
1. Click **"Create Web Service"**
2. Wait 5-10 minutes
3. Copy the URL: `https://ml-analysis-backend.onrender.com`

---

### Step 3: Update Frontend Configuration

#### 3.1 Update Amplify Environment Variables
1. Go to AWS Amplify Console
2. Select app: `complain-analyzer-ai`
3. Click **"Environment variables"**
4. Add/Update these variables:

| Variable | Value |
|----------|-------|
| `VITE_API_URL` | `https://complaint-analyzer-backend.onrender.com/api` |
| `VITE_ML_API_URL` | `https://ml-analysis-backend.onrender.com` |

5. Click **"Save"**
6. Go to **"Rewrites and redirects"**
7. Click **"Redeploy this version"**

---

### Step 4: Test Both Backends

#### 4.1 Test Main Backend
Open in browser: `https://complaint-analyzer-backend.onrender.com/api/health`

Should return: `{"status": "healthy"}`

#### 4.2 Test ML Backend
Open in browser: `https://ml-analysis-backend.onrender.com/`

Should show ML analysis interface or JSON response.

#### 4.3 Test Full Application
1. Go to: https://main.d1nokap2upnclw.amplifyapp.com
2. Register/login
3. Submit a complaint
4. Check if AI analysis works
5. Verify data appears in dashboard

---

## 🔧 Troubleshooting

### Main Backend Issues
- **CORS Error**: Check ALLOWED_ORIGINS includes your Amplify URL
- **MongoDB Error**: Verify cluster credentials
- **Build Failed**: Check requirements.txt

### ML Backend Issues
- **Build Failed**: Check ML dependencies in requirements.txt
- **Import Error**: Verify all Python packages are installed
- **Slow Response**: ML models take time to load on first request

### General Issues
- **Sleep Mode**: Both backends sleep after 15 minutes (free tier)
- **Cold Start**: First request after sleep takes 30-60 seconds
- **Logs**: Check Render logs for detailed errors

---

## 📝 Final URLs After Deployment

| Service | URL Example |
|---------|-------------|
| Frontend | https://main.d1nokap2upnclw.amplifyapp.com |
| Main Backend | https://complaint-analyzer-backend.onrender.com |
| ML Backend | https://ml-analysis-backend.onrender.com |
| MongoDB | cluster0.6ebj5lk.mongodb.net |

---

## 🎯 Quick Commands for Testing

```bash
# Test main backend health
curl https://complaint-analyzer-backend.onrender.com/api/health

# Test complaints endpoint
curl https://complaint-analyzer-backend.onrender.com/api/complaints

# Test ML backend
curl https://ml-analysis-backend.onrender.com/
```

---

## ✅ Success Checklist

- [ ] Main backend deployed and accessible
- [ ] ML backend deployed and accessible
- [ ] Frontend environment variables updated
- [ ] Frontend redeployed successfully
- [ ] User registration works
- [ ] Complaint submission works
- [ ] AI analysis works
- [ ] Dashboard shows data

---

## 🆘 Need Help?

If you get stuck:
1. Check Render logs for each service
2. Check Amplify build logs
3. Verify environment variables
4. Test endpoints directly
5. Check browser console (F12) for errors

**Ready? Start with Step 1!** 🚀
