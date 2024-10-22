FROM ubuntu:latest

RUN apt update && \
    apt install -y redis-server && \
apt clean

RUN sed -i 's/^bind 127.0.0.1 ::1/# bind 127.0.0.1 ::1/' /etc/redis/redis.conf && \
    sed -i 's/^# requirepass foobared/requirepass mypassword/' /etc/redis/redis.conf && \
    echo "protected-mode no" >> /etc/redis/redis.conf

EXPOSE 6379

# Start Redis using systemctl
CMD systemctl start redis-server
