<?php
// ** Database settings - Pulled from .env ** //
define('DB_NAME', 'wordock_db');
define('DB_USER', 'wordock_user');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'db'); // Use the service name "db" as defined in docker-compose.yml
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// ** Authentication unique keys and salts ** //
define('AUTH_KEY', '0/mW264TelIounoRVq2MVu31NHas0LsbgD71G4zXpjo=');
define('SECURE_AUTH_KEY', 'BG9AX4ESojXlhXSaCVd7vgT8d0HZCfK6SM+B1OS2Ikg=');
define('LOGGED_IN_KEY', 'GAmn2a2NadRRQgCwLai49LZwogaIIk5uVxWdRLuC4Pc=');
define('NONCE_KEY', 'BSpLG56B3LEuIk37QM4IDVhZNB9RC+ew84iPyO6gmFA=');
define('AUTH_SALT', 'iESuk/APovFOUIfNIMAD4W+JojZn7SJ2ex91mXrp0z8=');
define('SECURE_AUTH_SALT', '63MCUPgUyyhMfHycsxWE54uQKDu/iD3Wca1nRFKWIIA=');
define('LOGGED_IN_SALT', 'hFKj0Ri+dooo/T7CABQmSpxSxBZ4Lg+0D9Rpj5T2bdM=');
define('NONCE_SALT', 'hM3mOLVPN04yWHJl30/KUmOJw0dYOn8Qx4BviD7O6y8=');

// ** Table prefix ** //
$table_prefix = 'wp_';

// ** Debugging mode ** //
define('WP_DEBUG', true);

// ** WordPress absolute path ** //
if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}

// ** Sets up WordPress vars and included files ** //
require_once ABSPATH . 'wp-settings.php';
