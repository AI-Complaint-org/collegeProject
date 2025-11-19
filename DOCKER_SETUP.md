# Docker Setup for College Project Backends

This document explains how to set up and run the backend services using Docker.

## Prerequisites

- Docker installed on your system
- EC2 instance with Docker installed (for deployment)

## Environment Variables

The project uses a `.env` file for configuration. If the file doesn't exist, the run scripts will create a basic one automatically.

### Required Environment Variables

- `JWT_SECRET`: Secret key for JWT authentication
- `FLASK_ENV`: Flask environment (production/development)
- `FLASK_DEBUG`: Enable/disable Flask debug mode
- `API_BASE_URL`: Base URL for the main backend API
- `AI_API_BASE_URL`: Base URL for the AI analyzer backend

## Building Docker Images

```bash
# Build the main backend image
docker build -t complaint-backend ./backend

# Build the AI analyzer backend image
docker build -t sbackend-ai ./sbackend
```

## Running the Containers

### Option 1: Use the Run Scripts

**For Linux/Mac:**
```bash
chmod +x run-docker-containers.sh
./run-docker-containers.sh
```

**For Windows:**
```cmd
run-docker-containers.bat
```

### Option 2: Manual Docker Commands

```bash
# Run the main backend (port 5001)
docker run -d \
  --name complaint-backend \
  -p 5001:5001 \
  -v ~/collegeProject/sbackend/camplaint-analyzer/models:/app/sbackend/camplaint-analyzer/models \
  --env-file .env \
  complaint-backend

# Run the AI analyzer backend (port 5002)
docker run -d \
  --name sbackend-ai \
  -p 5002:5002 \
  -v ~/collegeProject/sbackend/camplaint-analyzer/models:/app/camplaint-analyzer/models \
  --env-file .env \
  sbackend-ai
```

## Volume Mounts

Both containers mount the models directory:
- Host: `~/collegeProject/sbackend/camplaint-analyzer/models`
- Backend container: `/app/sbackend/camplaint-analyzer/models`
- AI container: `/app/camplaint-analyzer/models`

## Port Configuration

- **Main Backend**: Port 5001 (http://localhost:5001)
- **AI Analyzer Backend**: Port 5002 (http://localhost:5002)

## Troubleshooting

### "open .env: no such file or directory" Error

This error occurs when Docker can't find the `.env` file. The run scripts now automatically create a basic `.env` file if it doesn't exist.

### Container Won't Start

1. Check if the Docker images were built successfully:
   ```bash
   docker images
   ```

2. Check container logs:
   ```bash
   docker logs complaint-backend
   docker logs sbackend-ai
   ```

3. Verify port availability:
   ```bash
   netstat -tulpn | grep :5001
   netstat -tulpn | grep :5002
   ```

### Permission Issues

If you encounter permission issues with volume mounts, ensure:
- The host directory exists
- The directory has proper read/write permissions
- Docker has access to the directory

## Stopping the Containers

```bash
docker stop complaint-backend sbackend-ai
docker rm complaint-backend sbackend-ai
```

## Health Checks

You can check if the services are running by accessing:
- http://localhost:5001/api/health (main backend)
- http://localhost:5002/api/health (AI backend)
