<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/AlternativaQuestao.class.php';

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
$smarty->assign("page", "questoes");
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
					$smarty->assign("questao_cod", $cod);
				else
					header("Location: questoes.php");
			}
		
		$questao = new Questao();
		$questao->setCodigo($cod);
		$data = $questao->getDataByCodigo();
		
		$smarty->assign("questao_descricao", $data['DESCRICAO']);
		$smarty->assign("questao_tipo", $data['TIP_QUE_COD']);
		
		$tipoQuestao = new TipoQuestao();
		$smarty->assign("listTiposQuestao", $tipoQuestao->listTiposQuestao());
		
		//Rows per page
		$lenght = 20;
		
		if (isset($_GET['page']))
			{
				$page = $_GET['page'];
			}
		else
			{
				$page = 1;
			}
			
		$start = ($page - 1) * $lenght;
		
		$alter = new AlternativaQuestao();
		$alter->setQuestao($questao);
		$data = $alter->listAlternativasByQuestaoAndPage($start, ($start+$lenght));
		$count = $alter->countByQuestao();
		
		$pagination = new Pagination($page, $count, $lenght, 1, "alternativas.php?action=editar&id=".$cod);
		
		$count = count($data);
		for ($i = 0; $i < $count; $i++)
			{
				$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2]);
			}
			
		$columns = array(
						'Código',
						'Descrição',
						'Resposta'
		);
				
		$smarty->assign("data", $data);
		$smarty->assign("columns", $columns);
		$smarty->assign("tableTitle", "Alternativas da Questão");
		$smarty->assign("pagination", $pagination->getPagenavi());
		$smarty->assign("url", "alternativas.php");
		
		//Errors
		$smarty->assign("geral_erro", $form->error("geral"));
		$smarty->assign("questao_descricao_erro", $form->error("questao_descricao"));
		$smarty->assign("questao_tipo_erro", $form->error("questao_tipo"));
		
	}

//Show the page
$smarty->display('admin\index.tpl');