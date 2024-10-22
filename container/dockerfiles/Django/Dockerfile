FROM ubuntu:latest

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    python3-dev \
    libpq-dev \
    gcc \
    && apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN pip3 install --no-cache-dir -r requirements.txt

# Copy Django project into container
COPY . /app/

EXPOSE 8000

ENTRYPOINT python3 manage.py runserver 0.0.0.0:8000
 
