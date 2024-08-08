# Stage 1: Build stage
FROM python:3.11-alpine AS builder

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install dependencies
RUN apk update && apk add --no-cache \
    build-base \
    libffi-dev \
    && pip install --upgrade pip

# Copy and install requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy application code
COPY . .

# Stage 2: Production stage
FROM python:3.11-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy application and installed dependencies from builder stage
COPY --from=builder /app /app

# Install Nginx and copy configuration
RUN apk add --no-cache nginx

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx and the Flask application
CMD ["sh", "-c", "nginx && python app.py"]
