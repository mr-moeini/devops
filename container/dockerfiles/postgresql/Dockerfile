FROM ubuntu:latest

RUN apt update && apt install -y postgresql postgresql-contrib && \
apt clean


RUN systemctl start postgresql && \
    sudo -u postgres psql -c "CREATE USER   pguser WITH PASSWORD 'pgpassword';" && \
    sudo -u postgres psql -c "ALTER USER pguser WITH SUPERUSER;" && \
    echo "listen_addresses='*'" >> /etc/postgresql/*/main/postgresql.conf && \
    echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/*/main/pg_hba.conf

# Expose port
EXPOSE 5432

# Use systemd to start services in the container
CMD ["systemctl start postgresql"]
