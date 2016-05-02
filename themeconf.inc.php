<?php
/*
Theme Name: CSH
Version: 1.0.0
Description: CSH theme for Piwigo. Based on the Bootstrap Default theme by Phil Bayfield (https://philio.me/).
Author: Steven Mirabito (smirabito@csh.rit.edu)
*/
require_once(PHPWG_THEMES_PATH . 'csh/include/themecontroller.php');
require_once(PHPWG_THEMES_PATH . 'csh/include/config.php');

$themeconf = array(
    'name' => 'csh',
    'parent' => 'default',
    'load_parent_css' => false,
    'load_parent_local_head' => false,
    'url' => 'https://csh.rit.edu/'
);

$controller = new \CSH\ThemeController();
$controller->init();