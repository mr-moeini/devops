FROM ubuntu:latest

RUN apt update && \
    apt install -y mysql-server

RUN systemctl start mysql && \
    mysql -e "CREATE USER 'mysqluser'@'%' IDENTIFIED BY 'mysqlpassword';" && \
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'mysqluser'@'%' WITH GRANT OPTION;" && \
    mysql -e "FLUSH PRIVILEGES;" && \
    sed -i 's/bind-address\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

EXPOSE 3306

CMD tail -f /dev/null