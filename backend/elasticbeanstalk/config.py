import os

# Elastic Beanstalk configuration
DEBUG = os.getenv('FLASK_ENV', 'production') == 'development'

# MongoDB Configuration
MONGODB_USERNAME = os.getenv('MONGODB_USERNAME', 'dhillon2317')
MONGODB_PASSWORD = os.getenv('MONGODB_PASSWORD', 'dhillon1000')
MONGODB_CLUSTER = os.getenv('MONGODB_CLUSTER', 'cluster0.6ebj5lk.mongodb.net')

# JWT Configuration
JWT_SECRET_KEY = os.getenv('JWT_SECRET_KEY', 'your-secret-key-change-in-production')

# CORS Configuration
ALLOWED_ORIGINS = os.getenv('ALLOWED_ORIGINS', 'https://main.d1nokap2upnclw.amplifyapp.com').split(',')

# Port configuration (Elastic Beanstalk sets PORT env var)
PORT = int(os.getenv('PORT', 5000))
