cat > /opt/docker-compose/docker-compose.yml <<ENDLINE
version: '3.1'

services:

  wordpress:
    container_name: wordpress
    image: wordpress:latest
    restart: always
    ports:
      - 80:80
      - 443:443
    environment:
      - "WORDPRESS_DB_HOST=db"
      - "WORDPRESS_DB_USER=\${MYSQL_USER}"
      - "WORDPRESS_DB_PASSWORD=\${MYSQL_PASSWORD}"
      - "WORDPRESS_DB_NAME=\${MYSQL_DATABASE}"
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./user-data/wordpress:/var/www/html
    depends_on:
      - db
    links:
     - db

  db:
    container_name: db
    image: mariadb:latest
    restart: always
    environment:
      - "MYSQL_ROOT_PASSWORD=\${MYSQL_ROOT_PASSWORD}"
      - "MYSQL_DATABASE=\${MYSQL_DATABASE}"
      - "MYSQL_USER=\${MYSQL_USER}"
      - "MYSQL_PASSWORD=\${MYSQL_PASSWORD}"
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./user-data/db:/var/lib/mysql

  wordpress-cli:
    container_name: cli
    image: wordpress:cli
    depends_on:
      - db
      - wordpress
    environment:
      - "WORDPRESS_DB_HOST=db"
      - "WORDPRESS_DB_USER=\${MYSQL_USER}"
      - "WORDPRESS_DB_PASSWORD=\${MYSQL_PASSWORD}"
      - "WORDPRESS_DB_NAME=\${MYSQL_DATABASE}"
      - "WORDPRESS_TITLE=\${WORDPRESS_TITLE}"
      - "WORDPRESS_ADMIN=\${WORDPRESS_ADMIN}"
      - "WORDPRESS_ADMIN_PASSWORD=\${WORDPRESS_ADMIN_PASSWORD}"
      - "WORDPRESS_ADMIN_EMAIL=\${WORDPRESS_ADMIN_EMAIL}"
    volumes:
      - ./user-data/wordpress:/var/www/html
    entrypoint: sh
    command: -c 'sleep 10; export; wp core install --url="http://\${IP_PUBLIC}" --title="\${WORDPRESS_TITLE}" --admin_name=\${WORDPRESS_ADMIN} --admin_password=\${WORDPRESS_ADMIN_PASSWORD} --admin_email=\${WORDPRESS_ADMIN_EMAIL}'
ENDLINE
