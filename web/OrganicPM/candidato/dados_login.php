<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/Pessoa.class.php';

$actions = array("remover", "editar");

if (isset($_GET['action']))
	{
		$action = $_GET['action'];
		if (!in_array($action, $actions))
			$action = "editar";
	}
else
	$action = "editar";


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
$smarty->assign("page", "dados_login");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);

//Errors
if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);
	
//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());


if ($session->loggedIn)
	{
		if ($action == "editar")
			{
				$usuario = new User();
				$usuario->setPessoa($pessoa);
				$usuario->getDataByPessoa();
				
				$smarty->assign("usuario", $usuario->getUsername());
				$smarty->assign("data_registro", date('d/m/Y', $usuario->getRegisterDate()));
				$smarty->assign("nivel_acesso", $usuario->getNivelAlias());
				
				//Errors
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("senha_atual_erro", $form->error("senha_atual"));
				$smarty->assign("senha_nova_erro", $form->error("senha_nova"));
				$smarty->assign("senha_nova_conf_erro", $form->error("senha_nova_conf"));
			}
		else
			{
				//Errors
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("senha_atual_erro", $form->error("senha_atual"));
			}
	}
	

//Show the page
$smarty->display('index.tpl');