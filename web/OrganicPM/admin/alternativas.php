<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/AlternativaQuestao.class.php';
include_once '../lib/TipoGabarito.class.php';
include_once '../lib/ValorGabarito.class.php';

global $form, $session;

$actions = array("editar");

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
$smarty->assign("page", "alternativas");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());

if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);
	
//Editar
if (strcmp($action, "editar") == 0)
	{
		if (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				
				if (is_numeric($cod))
					$smarty->assign("alt_que_cod", $cod);
				else
					header("Location: alternativas.php");
			}
		
		$alter = new AlternativaQuestao();
		$alter->setCodigo($cod);
		$data = $alter->getDataByCodigo();
		
		$tipoGab = $alter->getTipoGabaritoByCodigo();
		$valGab = new ValorGabarito();
		$valGab->setTipoGabarito($tipoGab);
		$valores = $valGab->listValorGabaritoByTipoGabarito();
		
		$smarty->assign("valores", $valores);
		
		$smarty->assign("alternativa", $data['DESCRICAO']);
		$smarty->assign("resposta", $data['VAL_GAB_COD']);
		
		//Errors
		$smarty->assign("geral_erro", $form->error("geral"));
		$smarty->assign("alternativa_erro", $form->error("alternativa"));
		$smarty->assign("resposta_erro", $form->error("resposta"));
		
	}

//Show the page
$smarty->display('admin\index.tpl');