<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/FlexiGrid/FlexiGrid.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/LoginSystem/UserLevel.class.php';
include_once '../lib/Pessoa.class.php';

global $form, $session;

$actions = array("novo", "listar", "pesquisar", "editar");

if (isset($_GET['action']))
	{
		$action = $_GET['action'];
		if (!in_array($action, $actions))
			$action = "listar";
	}
else
	$action = "listar";

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
$smarty->assign("page", "usuarios");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());

if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);

//Novo
if (strcmp($action, "novo") == 0)
	{
		
	}
	
//Editar
if (strcmp($action, "editar") == 0)
	{
		if (isset($_GET['id']) && is_numeric($_GET['id']))
			{
				$cod = $_GET['id'];
				$smarty->assign("pessoa_cod", $cod);
				
				$pessoa = new Pessoa();
				$pessoa->setCodigo($cod);
				
				$user = new User();
				$user->setPessoa($pessoa);
				$data = $user->getDataArrayByPessoa();
				
				$nivel = new UserLevel();
				$niveis = $nivel->listNiveis();
				$smarty->assign("niveis", $niveis);
								
				$smarty->assign("usuario", $data['NOME']);
				$smarty->assign("nivel_acesso", $data['NIVEL']);
				$smarty->assign("status", $data['STATUS']);
				
				//Errors
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("usuario_erro", $form->error("usuario"));
				$smarty->assign("nivel_acesso_erro", $form->error("nivel_acesso"));
				$smarty->assign("senha_erro", $form->error("senha"));
				$smarty->assign("senha_conf_erro", $form->error("senha_conf"));
				$smarty->assign("status_erro", $form->error("status"));
			}
		else
			header("Location: usuarios.php");
	}
	
//Listar
if (strcmp($action, "listar") == 0)
	{
		$usuario = new User();
		
		//FlexiGrid
		$flex = new FlexiGrid($usuario);
		$flex->setTitle("Usuários");
		$flex->setUrl("userFunctions.php");
		$flex->setEdit(array('caption' => 'Editar', 'url' => 'usuarios.php?action=editar&id='));
		$flex->setAdd(array('caption' => 'Novo', 'url' => 'usuarios.php?action=novo'));
		$flex->setDelBtn('false');
			 
		$smarty->assign("flexigrid", $flex->generateConfig());
	}

//Show the page
$smarty->display('admin\index.tpl');