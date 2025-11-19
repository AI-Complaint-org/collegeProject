@echo off
REM Script to run both backend containers with correct configurations
REM Make sure to build images first:
REM docker build -t complaint-backend ./backend
REM docker build -t sbackend-ai ./sbackend

echo Starting backend containers...

REM Backend 1 (complaint-backend) - Port 5001
echo Starting complaint-backend on port 5001...
docker run -d --name complaint-backend -p 5001:5001 -v %USERPROFILE%\collegeProject\sbackend\camplaint-analyzer\models:/app/sbackend/camplaint-analyzer/models --env-file .env complaint-backend

REM Backend 2 (sbackend-ai) - Port 5002  
echo Starting sbackend-ai on port 5002...
docker run -d --name sbackend-ai -p 5002:5002 -v %USERPROFILE%\collegeProject\sbackend\camplaint-analyzer\models:/app/camplaint-analyzer/models --env-file .env sbackend-ai

echo Both containers started!
echo Backend 1: http://localhost:5001
echo Backend 2: http://localhost:5002

echo.
echo Container status:
docker ps
