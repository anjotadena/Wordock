<?php
// ** Database settings - Pulled from .env ** //
define('DB_NAME', 'wordock_db');
define('DB_USER', 'wordock_user');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'db'); // Use the service name "db" as defined in docker-compose.yml
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// define('WP_HOME', 'https://localhost');
// define('WP_SITEURL', 'https://localhost');

// ** Authentication unique keys and salts ** //
define('AUTH_KEY', '4VfH5G7KcvdCV5b51SkJ9qdj+6gCt77Ngfg1IKiDPyk=');
define('SECURE_AUTH_KEY', 'A7GV7MOFHv+L5H6iKVGVInIAdxx5thbpWsWML5bvfRA=');
define('LOGGED_IN_KEY', 'rqlmeFHwQEfbu3Wu0idfcTPSQPYLo5TqGjVONGJ+SiQ=');
define('NONCE_KEY', '3RXqv9ppTApI6/wYiOK2nhtw3de0JvtuddI6GHMLLTo=');
define('AUTH_SALT', 'uFkI/yirCxSJFfbFyYAc6Jq4fezAqA4IhtYZMVasTWE=');
define('SECURE_AUTH_SALT', 'LxbI3hG7+n8W54T6BBdzSlIqMKEkWArJVP/EFSQb4Vo=');
define('LOGGED_IN_SALT', '7navZezUOyeh9VNCWlF9gJe2/VS7Be9PapibqppEVn0=');
define('NONCE_SALT', 'JsT2wF+v9RVjzSwTXBkfqlmQdgMzW4t+WFGtGdABeqI=');

// ** Table prefix ** //
$table_prefix = 'wp_';

// ** Debugging mode ** //
define('WP_DEBUG', false);

// ** WordPress absolute path ** //
if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}

// ** Sets up WordPress vars and included files ** //
require_once ABSPATH . 'wp-settings.php';
