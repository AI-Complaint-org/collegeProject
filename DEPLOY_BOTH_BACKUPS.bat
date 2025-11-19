@echo off
echo 🚀 DEPLOY BOTH BACKENDS HELPER
echo ================================
echo.
echo This will guide you through deploying BOTH backends to Render.com
echo.
echo Backend 1: Main API (authentication, complaints)
echo Backend 2: ML Analysis (AI processing)
echo.
pause
echo.
echo STEP 1: Deploy Main Backend
echo ---------------------------
echo 1. Go to https://render.com/
echo 2. Click "New +" -> "Web Service"
echo 3. Repository: tajinder23127/CollegeProject
echo 4. Root Directory: backend
echo 5. Name: complaint-analyzer-backend
echo 6. Runtime: Python 3
echo 7. Build: pip install -r requirements.txt
echo 8. Start: gunicorn --bind 0.0.0.0:%%PORT%% app:app
echo 9. Instance Type: Free
echo.
echo Environment Variables:
echo - MONGODB_USERNAME = tajinder23127
echo - MONGODB_PASSWORD = dhillon1000
echo - MONGODB_CLUSTER = cluster0.6ebj5lk.mongodb.net
echo - FLASK_ENV = production
echo - ALLOWED_ORIGINS = https://main.d1nokap2upnclw.amplifyapp.com,http://localhost:5173
echo.
echo After deployment, copy this URL: https://complaint-analyzer-backend.onrender.com
echo.
pause
echo.
echo STEP 2: Deploy ML Backend
echo -------------------------
echo 1. Go back to Render.com dashboard
echo 2. Click "New +" -> "Web Service"
echo 3. Same repository: tajinder23127/CollegeProject
echo 4. Root Directory: sbackend/camplaint-analyzer
echo 5. Name: ml-analysis-backend
echo 6. Runtime: Python 3
echo 7. Build: pip install -r requirements.txt
echo 8. Start: gunicorn --bind 0.0.0.0:%%PORT%% app:app
echo 9. Instance Type: Free
echo.
echo Environment Variables:
echo - FLASK_ENV = production
echo.
echo After deployment, copy this URL: https://ml-analysis-backend.onrender.com
echo.
pause
echo.
echo STEP 3: Update Frontend
echo -----------------------
echo 1. Go to AWS Amplify Console
echo 2. Select app: complain-analyzer-ai
echo 3. Environment variables -> Add:
echo    - VITE_API_URL = https://complaint-analyzer-backend.onrender.com/api
echo    - VITE_ML_API_URL = https://ml-analysis-backend.onrender.com
echo 4. Save and redeploy
echo.
pause
echo.
echo STEP 4: Test Everything
echo -----------------------
echo Test URLs:
echo - Main Backend: https://complaint-analyzer-backend.onrender.com/api/health
echo - ML Backend: https://ml-analysis-backend.onrender.com/
echo - Frontend: https://main.d1nokap2upnclw.amplifyapp.com
echo.
echo 🎉 DONE! Both backends are deployed for $0/month!
echo.
pause
