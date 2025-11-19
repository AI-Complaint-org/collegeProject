#!/bin/bash

echo "🚀 Deploying Backend to AWS Elastic Beanstalk..."

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI not found. Please install it first."
    echo "Visit: https://aws.amazon.com/cli/"
    exit 1
fi

# Check if EB CLI is installed
if ! command -v eb &> /dev/null; then
    echo "❌ EB CLI not found. Installing..."
    pip install awsebcli --upgrade --user
    echo "Please add EB CLI to your PATH and run this script again."
    exit 1
fi

# Navigate to backend directory
cd backend

echo "📦 Initializing Elastic Beanstalk application..."
eb init -p python-3.9 complaint-analyzer-backend --region us-east-1

echo "🌍 Creating Elastic Beanstalk environment..."
eb create production --instance-type t3.micro --min-instances 1 --max-instances 1

echo "⚙️ Setting environment variables..."
eb setenv \
    MONGODB_USERNAME=dhillon2317 \
    MONGODB_PASSWORD=dhillon1000 \
    MONGODB_CLUSTER=cluster0.6ebj5lk.mongodb.net \
    FLASK_ENV=production \
    ALLOWED_ORIGINS=https://main.d1nokap2upnclw.amplifyapp.com,http://localhost:3000 \
    SECRET_KEY=$(openssl rand -hex 32)

echo "🚀 Deploying application..."
eb deploy

echo "✅ Getting deployment status..."
eb status

echo "🎉 Backend deployment completed!"
echo "Your backend URL will be shown above. Copy it for frontend configuration."
