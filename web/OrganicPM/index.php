<?php 

include_once 'config/config.inc.php';
include_once 'lib/vendor/Smarty/libs/Smarty.class.php';
include_once 'lib/LoginSystem/Session.class.php';
include_once 'lib/LoginSystem/Visit.class.php';

global $session;

//==================================================================
// Template ========================================================
//==================================================================

$smarty = new Smarty;

//Smarty Configs
$smarty->template_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates';
$smarty->compile_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates_c';
$smarty->cache_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/cache';
$smarty->config_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/configs';
$smarty->compile_check	= true;
$smarty->debugging		= true;

//Variables
$smarty->assign("title", "OrganicPM");
$smarty->assign("subtitle", "People Management System");
$smarty->assign("page", "index");
$smarty->assign("isAdmin", $session->isAdmin());
$smarty->assign("logado", $session->loggedIn);

//Show the page
$smarty->display('index.tpl');