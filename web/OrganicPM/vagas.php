<?php 

include_once 'config/config.inc.php';
include_once 'lib/vendor/Smarty/libs/Smarty.class.php';
include_once 'lib/LoginSystem/Session.class.php';
include_once 'lib/LoginSystem/Visit.class.php';
include_once 'lib/ProcessoSeletivo.class.php';
include_once 'lib/Pagination/pagination.class.php';

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
$smarty->assign("page", "vagasPanel");
$smarty->assign("isAdmin", $session->isAdmin());
$smarty->assign("logado", $session->loggedIn);

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

$procSel = new ProcessoSeletivo();
$data = $procSel->listProcSelAtivosByPage($start, ($start+$lenght));
$count = $procSel->countAtivos();

$pagination = new Pagination($page, $count, $lenght, 1, "vagas.php");

$count = count($data);
for ($i = 0; $i < $count; $i++)
	{
		$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3], $data[$i][4], $data[$i][5]);
	}
	
$columns = array(
				'Código',
				'Descrição',
				'Data de Início',
				'Data de Fim',
				'Vagas',
				'Cargo'
			);
		
$smarty->assign("data", $data);
$smarty->assign("columns", $columns);
$smarty->assign("tableTitle", "Vagas Abertas");
$smarty->assign("pagination", $pagination->getPagenavi());

//Show the page
$smarty->display('index.tpl');