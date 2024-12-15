#!/bin/bash

echo "Starting Wordock installation..."

# Check if Docker is installed
if ! [ -x "$(command -v docker)" ]; then
  echo "Error: Docker is not installed. Please install Docker first." >&2
  exit 1
fi

# Check if Docker Compose is installed
if ! [ -x "$(command -v docker-compose)" ]; then
  echo "Error: Docker Compose is not installed. Please install Docker Compose first." >&2
  exit 1
fi

# Create necessary directories
echo "Setting up directories..."
mkdir -p src
mkdir -p config/php
mkdir -p config/nginx

# Add .gitkeep
touch src/.gitkeep

# Download WordPress if not already in src/
if [ ! -f "src/index.php" ]; then
  echo "Downloading WordPress..."
  curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz
  tar -xzf wordpress.tar.gz --strip-components=1 -C src
  rm wordpress.tar.gz
  echo "WordPress files downloaded."
else
  echo "WordPress files already exist in the src/ directory."
fi

# Generate .env file if not present
if [ ! -f ".env" ]; then
  echo "Creating default .env file..."
  cat <<EOT > .env
# WordPress Configuration
WP_PORT=8082
WP_PORT_HTTPS=8083
WP_DB_NAME=wordock_db
WP_DB_USER=wordock_user
WP_DB_PASSWORD=password

# MySQL Configuration
DB_ROOT_PASSWORD=root
EOT
  echo ".env file created. Please customize it as needed."
else
  echo ".env file already exists."
fi

# Load .env variables
echo "Loading environment variables from .env..."
export $(grep -v '^#' .env | xargs)

# Generate default Nginx config if not present
if [ ! -f "config/nginx/nginx.conf" ]; then
  echo "Creating default Nginx configuration..."
  cat <<EOT > config/nginx/nginx.conf
server {
    listen 80;
    server_name localhost;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php\$ {
        include fastcgi_params;
        fastcgi_pass wordock-php:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOT
  echo "Default Nginx configuration created."
else
  echo "Nginx configuration already exists."
fi

# Generate default PHP configuration if not present
if [ ! -f "config/php/php.ini" ]; then
  echo "Creating default PHP configuration..."
  cat <<EOT > config/php/php.ini
memory_limit = 512M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 300
EOT
  echo "Default PHP configuration created."
else
  echo "PHP configuration already exists."
fi

# Generate wp-config.php if not already present
if [ ! -f "src/wp-config.php" ]; then
  echo "Generating wp-config.php..."
  cat <<EOT > src/wp-config.php
<?php
// ** Database settings - Pulled from .env ** //
define('DB_NAME', '${WP_DB_NAME}');
define('DB_USER', '${WP_DB_USER}');
define('DB_PASSWORD', '${WP_DB_PASSWORD}');
define('DB_HOST', 'db'); // Use the service name "db" as defined in docker-compose.yml
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// ** Authentication unique keys and salts ** //
define('AUTH_KEY', '$(openssl rand -base64 32)');
define('SECURE_AUTH_KEY', '$(openssl rand -base64 32)');
define('LOGGED_IN_KEY', '$(openssl rand -base64 32)');
define('NONCE_KEY', '$(openssl rand -base64 32)');
define('AUTH_SALT', '$(openssl rand -base64 32)');
define('SECURE_AUTH_SALT', '$(openssl rand -base64 32)');
define('LOGGED_IN_SALT', '$(openssl rand -base64 32)');
define('NONCE_SALT', '$(openssl rand -base64 32)');

// ** Table prefix ** //
\$table_prefix = 'wp_';

// ** Debugging mode ** //
define('WP_DEBUG', true);

// ** WordPress absolute path ** //
if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}

// ** Sets up WordPress vars and included files ** //
require_once ABSPATH . 'wp-settings.php';
EOT
  echo "wp-config.php generated successfully!"
else
  echo "wp-config.php already exists. Skipping generation."
fi


# Start the Docker Compose environment
echo "Starting Docker containers..."
docker-compose up

# Output success message with dynamic port
echo "Wordock has been successfully installed!"
echo "Visit your WordPress site at: http://localhost:${WP_PORT}"
echo "Visit your WordPress site at: https://localhost:${WP_PORT_HTTPS}"
echo "PHPMyAdmin is available at: https://localhost:9080"
echo "MailHog is available at: https://localhost:8025"
