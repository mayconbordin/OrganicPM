<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Cargo.class.php';
include_once '../lib/TipoFase.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/Notas.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/FaseTeste.class.php';

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
$smarty->assign("page", "fases");
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
					$smarty->assign("fase_cod", $cod);
				else
					header("Location: fase.php");
			}
		
		$fase = new Fases();
		$fase->setCodigo($cod);
		$data = $fase->getDataByCodigo();
						
		$tipoFase = new TipoFase();
		$smarty->assign("listTiposFase", $tipoFase->listTiposFase());
		
		if (stripos($data['FASE'], "teste") !== false)
			{
				$teste = new Teste();
				$smarty->assign("listTestes", $teste->listTestes());
				
				$notas = new Notas();
				$smarty->assign("listNotas", $notas->listNotas());
				
				$smarty->assign("teste", true);
				
				//Fase teste
				$faseTeste = new FaseTeste();
				$faseTeste->setFase($fase);
				$info = $faseTeste->getDataByFase();
								
				$smarty->assign("fase_teste", $info['TESTE_COD']);
				$smarty->assign("fase_nota", $info['NOTA']);
			}
		else
			$smarty->assign("teste", false);
		
		$smarty->assign("fase_tipo", $data['TIP_FAS_COD']);
		$smarty->assign("fase_data_inicio", $data['DATA_INICIO']);
		$smarty->assign("fase_data_fim", $data['DATA_FIM']);
		
		//Errors
		$smarty->assign("geral_erro", $form->error("geral"));
		$smarty->assign("fase_tipo_erro", $form->error("fase_tipo"));
		$smarty->assign("teste_erro", $form->error("teste"));
		$smarty->assign("nota_erro", $form->error("nota"));
		$smarty->assign("fase_data_inicio_erro", $form->error("fase_data_inicio"));
		$smarty->assign("fase_data_fim_erro", $form->error("fase_data_fim"));
		
	}

//Show the page
$smarty->display('admin\index.tpl');