FROM mariadb:10.2

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y tzdata patch && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN ln -s /usr/share/mysql/mroonga/install.sql /docker-entrypoint-initdb.d/mroonga-install.sql
COPY *.cnf /etc/mysql/mariadb.conf.d/
RUN mkdir -p /etc/mysql/local.conf.d/
COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 3306 4567/tcp 4567/udp 4568 4444
CMD ["mysqld"]
