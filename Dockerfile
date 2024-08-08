# Build the application
FROM python:3.11-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN apk add --no-cache gcc musl-dev libffi-dev \
    && pip install --upgrade pip \
    && pip install -r requirements.txt
COPY . .

# Run the application with NGINX as a reverse proxy
FROM nginx:alpine
WORKDIR /app
COPY --from=builder /app /app
COPY nginx.conf /etc/nginx/nginx.conf

# Install necessary packages for running the app
RUN apk add --no-cache bash curl \
    && apk add --no-cache uwsgi uwsgi-python3

EXPOSE 80

# Start the Flask app with uWSGI and NGINX
CMD ["sh", "-c", "uwsgi --socket 127.0.0.1:5000 --protocol=http -w app:app & nginx -g 'daemon off;'"]

