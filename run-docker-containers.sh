#!/bin/bash

# Script to run both backend containers with correct configurations
# Make sure to build images first:
# docker build -t complaint-backend ./backend
# docker build -t sbackend-ai ./sbackend

echo "Starting backend containers..."

# Check if .env file exists, if not create a basic one
if [ ! -f .env ]; then
    echo "Creating basic .env file..."
    cat > .env << EOF
JWT_SECRET=college-project-jwt-secret-key-2024-secure
FLASK_ENV=production
FLASK_DEBUG=False
API_BASE_URL=http://localhost:5001
AI_API_BASE_URL=http://localhost:5002
EOF
fi

# Backend 1 (complaint-backend) - Port 5001
echo "Starting complaint-backend on port 5001..."
docker run -d \
  --name complaint-backend \
  -p 5001:5001 \
  -v ~/collegeProject/sbackend/camplaint-analyzer/models:/app/sbackend/camplaint-analyzer/models \
  --env-file .env \
  complaint-backend

# Backend 2 (sbackend-ai) - Port 5002  
echo "Starting sbackend-ai on port 5002..."
docker run -d \
  --name sbackend-ai \
  -p 5002:5002 \
  -v ~/collegeProject/sbackend/camplaint-analyzer/models:/app/camplaint-analyzer/models \
  --env-file .env \
  sbackend-ai

echo "Both containers started!"
echo "Backend 1: http://localhost:5001"
echo "Backend 2: http://localhost:5002"

# Check container status
echo ""
echo "Container status:"
docker ps
