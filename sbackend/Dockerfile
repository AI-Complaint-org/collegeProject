
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker cache
COPY camplaint-analyzer/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY camplaint-analyzer/ .

# Expose the port the app runs on
EXPOSE 5002

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:5002", "app:app"]
