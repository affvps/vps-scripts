<?php
// auth();
function auth ()
{
        $valid_passwords = array ("user" => "password");
        $valid_users = array_keys($valid_passwords);

        $user = $_SERVER['PHP_AUTH_USER'];
        $pass = $_SERVER['PHP_AUTH_PW'];

        $validated = (in_array($user, $valid_users)) && ($pass == $valid_passwords[$user]);

        if (!$validated) {
          header('WWW-Authenticate: Basic realm="My Realm"');
          header('HTTP/1.0 401 Unauthorized');
          die ("Not authorized");
        }
}

define('H5AI_VERSION', '0.29.0');
define('MIN_PHP_VERSION', '5.5.0');

if (!function_exists('version_compare') || version_compare(PHP_VERSION, MIN_PHP_VERSION, '<')) {
    header('Content-type: text/plain;charset=utf-8');
    exit('[ERR] h5ai requires PHP ' . MIN_PHP_VERSION . ' or later, but found PHP ' . PHP_VERSION);
}

if (substr(H5AI_VERSION, 0, 1) === '{') {
    header('Content-type: text/plain;charset=utf-8');
    exit('[ERR] h5ai sources must be preprocessed to work correctly');
}

require_once __DIR__ . '/../private/php/class-bootstrap.php';
Bootstrap::run();
