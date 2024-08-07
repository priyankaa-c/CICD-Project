# Stage 1: Build the application
FROM python:3.11-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN apk add --no-cache gcc musl-dev libffi-dev \
    && pip install --upgrade pip \
    && pip install -r requirements.txt
COPY . .

# Stage 2: Run the application with NGINX
FROM nginx:alpine
COPY --from=builder /app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
