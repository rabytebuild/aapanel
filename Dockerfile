# Use the official aaPanel Docker image
FROM aapanel/aapanel:lib

# Expose the necessary ports
EXPOSE 7800 888 443 80

# Set the volume mounts for website data, MySQL data, and Vhost file
VOLUME ["/www/wwwroot", "/www/server/data", "/www/server/panel/vhost"]

# Command to run aaPanel on container startup
CMD ["-d", "-p", "8886:7800", "-p", "443:443", "-p", "80:80", "-v", "~/website_data:/www/wwwroot", "-v", "~/mysql_data:/www/server/data", "-v", "~/vhost:/www/server/panel/vhost", "aapanel/aapanel:lib"]
