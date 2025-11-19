@echo off
echo 🆓 FREE DEPLOYMENT HELPER
echo ========================
echo.
echo This will guide you through the FREE deployment process.
echo.
echo STEP 1: Backend Deployment to Render.com
echo -----------------------------------------
echo 1. Open https://render.com/
echo 2. Sign up with GitHub
echo 3. Click "New +" -> "Web Service"
echo 4. Connect repository: tajinder23127/CollegeProject
echo 5. Configure:
echo    - Root Directory: backend
echo    - Runtime: Python 3
echo    - Build Command: pip install -r requirements.txt
echo    - Start Command: gunicorn --bind 0.0.0.0:%%PORT%% app:app
echo    - Instance Type: Free
echo 6. Add Environment Variables:
echo    - MONGODB_USERNAME = tajinder23127
echo    - MONGODB_PASSWORD = dhillon1000
echo    - MONGODB_CLUSTER = cluster0.6ebj5lk.mongodb.net
echo    - FLASK_ENV = production
echo    - ALLOWED_ORIGINS = https://main.d1nokap2upnclw.amplifyapp.com,http://localhost:5173
echo.
echo After deployment, copy your backend URL!
echo.
pause
echo.
echo STEP 2: Update Frontend Configuration
echo ------------------------------------
echo 1. Go to https://console.aws.amazon.com/amplify/
echo 2. Select app: complain-analyzer-ai
echo 3. Click "Environment variables"
echo 4. Add: VITE_API_URL = https://YOUR-BACKEND-URL.onrender.com/api
echo 5. Save and redeploy
echo.
pause
echo.
echo STEP 3: Test Your Deployment
echo ----------------------------
echo 1. Visit: https://main.d1nokap2upnclw.amplifyapp.com
echo 2. Try submitting a complaint
echo 3. Check if it appears in dashboard
echo.
echo 🎉 DONE! Your app is live for $0/month!
echo.
pause
