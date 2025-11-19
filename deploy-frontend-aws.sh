#!/bin/bash

echo "🚀 Deploying Frontend to AWS Amplify..."

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI not found. Please install it first."
    echo "Visit: https://aws.amazon.com/cli/"
    exit 1
fi

# Check if Amplify CLI is installed
if ! command -v amplify &> /dev/null; then
    echo "❌ Amplify CLI not found. Installing..."
    npm install -g @aws-amplify/cli
    echo "Please configure Amplify with 'amplify configure' and run this script again."
    exit 1
fi

# Navigate to frontend directory
cd frontend/complain-analyzer-ai

echo "📦 Installing dependencies..."
npm install

echo "🔨 Building application..."
npm run build

echo "🚀 Deploying to Amplify..."
amplify publish --yes

echo "✅ Frontend deployment completed!"
echo "Your frontend URL will be shown above."
