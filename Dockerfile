FROM ubuntu:latest

# Update the package lists
RUN apt-get update

# Install dependencies
RUN apt-get install -y wget

# Download aaPanel installation script
RUN wget -O install-ubuntu_6.0_en.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh

# Run aaPanel installation script
RUN bash install-ubuntu_6.0_en.sh

# Expose all ports
EXPOSE 80 443 7800 888 8888 3306 8889 21 22 39000-40000

# Start aaPanel service
CMD /etc/init.d/bt start && /bin/bash
