<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db' );

/** Database username */
define( 'DB_USER', 'billy' );

/** Database password */
define( 'DB_PASSWORD', '2' );

/** Database hostname */
define( 'DB_HOST', 'db' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'L1K/X*&_gxt(v(#afQaGS1(oCa*/j]G#2v!<j/%Q?cnTpU$1VP#w~=&q1N!07$n1' );
define( 'SECURE_AUTH_KEY',  'cefx;(xi6#lv6KVN^ujb_pkF&bTd!5(K2Z+y#ss`n7Nu*m}#|Pce1q}`H .,v>Az' );
define( 'LOGGED_IN_KEY',    'Zy48j R-cUb 5toLk<SpX3F.[,>g,U+s=g.*hmrj,_x+De[cn0nS5b7)X,*%nxod' );
define( 'NONCE_KEY',        'XzCGu#(D8Q.fx?e=w->n>Tbm^9 -parIp;nJxka42Rk.gV thwR;aA(lx)T1+42Z' );
define( 'AUTH_SALT',        'M#Wz^!AelNt.9ru7rpr)$9?Y3+K+WN.(MTBV-?gKz<9IC@hHh@4h0d=QZt_%?hgG' );
define( 'SECURE_AUTH_SALT', 'x6x-IIAlx[tS*/g<1$_Xz|PJY{xu6OQHWxp3KE*#<{qs37C3#X4e9zN%:,QM;P$u' );
define( 'LOGGED_IN_SALT',   'hLFDq1;Y(ESo;X7v!=iMX}>M`TCBIqz^c*piif=,Wvxt]1|P@;A5u>2*7IRtB0O7' );
define( 'NONCE_SALT',       '/I>$@9De!._Afhs[gKbx4*bjo#>2g0wCHhg}n24gNx4`n N;Ei`Zl0(n|aml^#j<' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';