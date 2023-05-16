# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Set environment variables
ENV AA_PANEL_VERSION="v10.8.0"
ENV MYSQL_VERSION="5.7"

# Set build arguments
ARG AA_PANEL_USERNAME="admin"
ARG AA_PANEL_PASSWORD="Rabiu2004@"

# Update the package lists and install required packages
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y curl && \
    apt-get install -y unzip && \
    apt-get install -y nginx && \
    apt-get install -y mariadb-server

# Download and install aapanel
RUN wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && \
    bash install.sh

# Set up the database
RUN service mysql start && \
    mysql -e "CREATE DATABASE aapanel;" && \
    mysql -e "GRANT ALL PRIVILEGES ON aapanel.* TO 'aapanel'@'localhost' IDENTIFIED BY 'Rabiu2004@';" && \
    mysql -e "FLUSH PRIVILEGES;"

# Configure nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 8888
EXPOSE 8080

# Set the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
