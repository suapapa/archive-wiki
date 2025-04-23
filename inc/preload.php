<?php
// inc/preload.php
if (!defined('DOKU_E_LEVEL')) {
    define('DOKU_E_LEVEL', E_ALL & ~E_NOTICE & ~E_DEPRECATED); // E_STRICT 제거
}
