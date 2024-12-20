#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt install python3 python3-venv python3-pip nginx curl git -y

# Install supervisor for process management
sudo apt install supervisor -y


# Clone the Django project
git clone <repo-url> django_project
cd django_project

# Create virtual environment and install dependencies
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --noinput

# Test the server
python manage.py runserver 0.0.0.0:8000 &


# Install gunicorn
pip install gunicorn

# Create supervisor configuration
sudo tee /etc/supervisor/conf.d/django.conf > /dev/null <<EOF
[program:django]
command=/home/ubuntu/django_project/venv/bin/gunicorn --workers 3 --bind 0.0.0.0:8000 django_project.wsgi:application
directory=/home/ubuntu/django_project
user=ubuntu
autostart=true
autorestart=true
stderr_logfile=/var/log/django.err.log
stdout_logfile=/var/log/django.out.log
EOF

# Start Supervisor
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start django


# Clone Flutter project and build
git clone <flutter-repo-url> flutter_project
cd flutter_project
flutter build web

# Copy build files to Nginx root directory
sudo mkdir -p /var/www/flutter_app
sudo cp -r build/web/* /var/www/flutter_app/


# Create Nginx configuration for both frontend and backend
sudo tee /etc/nginx/sites-available/project > /dev/null <<EOF
server {
    listen 80;
    server_name yourdomain.com;

    # Serve Flutter frontend
    location / {
        root /var/www/flutter_app;
        index index.html;
        try_files \$uri /index.html;
    }

    # Proxy to Django backend
    location /api/ {
        proxy_pass http://127.0.0.1:8000/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

# Enable configuration and restart Nginx
sudo ln -s /etc/nginx/sites-available/project /etc/nginx/sites-enabled
sudo nginx -t
sudo systemctl restart nginx
