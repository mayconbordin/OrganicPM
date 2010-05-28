<?php 

include_once 'config/config.inc.php';
include_once 'lib/vendor/Smarty/libs/Smarty.class.php';
include_once 'lib/LoginSystem/Session.class.php';
include_once 'lib/LoginSystem/Visit.class.php';

global $form;

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
$smarty->debugging		= false;

//Variables
$smarty->assign("title", "OrganicPM");
$smarty->assign("subtitle", "People Management System");
$smarty->assign("page", "login");
$smarty->assign("challengeVar", $session->chap->getChallengeVar("challenge"));

//Session flag
$smarty->assign("logado", $session->loggedIn);

//Form Validation
$smarty->assign("user", $form->value("user"));
$smarty->assign("pass", $form->value("pass"));
$smarty->assign("userError", $form->error("user"));
$smarty->assign("passError", $form->error("pass"));
$smarty->assign("genError", $form->error("general"));
$smarty->assign("remember", $form->value("remember"));

//Show the page
$smarty->display('index.tpl');