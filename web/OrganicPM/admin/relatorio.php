<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/TipoTeste.class.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/Report.class.php';
include_once '../lib/ProcessoSeletivo.class.php';

include_once '../plugins/getDateInterval.function.php';
include_once '../plugins/getNumDays.function.php';

global $form, $session;

$types = array("full", "procsel");

if (isset($_GET['type']))
	{
		if (in_array($_GET['type'], $types))
			$type = $_GET['type'];
	}
else
	$type = "full";

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
$smarty->assign("page", "reports");
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());
$smarty->assign("url", "relatorio.php");
$smarty->assign("type", $type);

//Now
$smarty->assign("year", date('Y'));
$smarty->assign("month", (date('m')-1));
$smarty->assign("day", date('d'));

//Full report
if (strcmp($type, "full") == 0)
	{
		if (isset($_GET['data_inicio']))
			$dataInicio = $_GET['data_inicio'];
			
		if (isset($_GET['data_fim']))
			$dataFim = $_GET['data_fim'];
			
		if (isset($_GET['graph_type']))
			$graphType = $_GET['graph_type'];
		else
			$graphType = "line";
			
		$smarty->assign("graph_type", $graphType);
			
		if (!$dataInicio && !$dataFim)
			{
				$report = new Report();
				$report->setFormat("days");
				$report->setStartDay(1);
				$report->setStartMonth(date('m'));
				$report->setStartYear(date('Y'));
				$report->setEndDay(date('d'));
				$report->setEndMonth(date('m'));
				$report->setEndYear(date('Y'));
				
				$report->generateReport();
				
				$visitas = implode(",",$report->getVisitas());
				$cadastros = implode(",", $report->getCadastros());
				$incricoes = implode(",", $report->getCandProcSel());
				$periodo = implode(",", $report->getDays());
				
				$smarty->assign("visitas", $visitas);
				$smarty->assign("cadastros", $cadastros);
				$smarty->assign("inscricoes", $incricoes);
				$smarty->assign("periodo",$periodo);
				$smarty->assign("tipo", "Dia");
				
				$smarty->assign("periodoInicial",'01/'.date('m').'/'.date('Y'));
				$smarty->assign("periodoFinal",date('d').'/'.date('m').'/'.date('Y'));
			}
		elseif ($dataInicio && $dataFim)
			{
				$perIni = $dataInicio;
				$perFin = $dataFim;
				
				$dataInicio = explode("/", $dataInicio);
				$dataFim = explode("/", $dataFim);
				
				$days = getNumDays($dataInicio[2],$dataInicio[1],$dataInicio[0],$dataFim[2],$dataFim[1],$dataFim[0]);
				
				$report = new Report();
				
				if ($days <= 30)
					{
						$report->setFormat("days");
						$smarty->assign("tipo", "Dia");
					}
				elseif ($days > 30)
					{
						$report->setFormat("months");
						$smarty->assign("tipo", "Mês");
					}
				
				$report->setStartDay($dataInicio[0]);
				$report->setStartMonth($dataInicio[1]);
				$report->setStartYear($dataInicio[2]);
				$report->setEndDay($dataFim[0]);
				$report->setEndMonth($dataFim[1]);
				$report->setEndYear($dataFim[2]);
				
				$report->generateReport();
				
				$visitas = implode(",",$report->getVisitas());
				$cadastros = implode(",", $report->getCadastros());
				$incricoes = implode(",", $report->getCandProcSel());
				
				if ($days <= 30)
					$periodo = implode(",", $report->getDays());
				elseif ($days > 30)
					$periodo = implode(",", $report->getMonths("string"));
				
				$smarty->assign("visitas", $visitas);
				$smarty->assign("cadastros", $cadastros);
				$smarty->assign("inscricoes", $incricoes);
				$smarty->assign("periodo",$periodo);
				
				$smarty->assign("periodoInicial",$perIni);
				$smarty->assign("periodoFinal",$perFin);
			}
	}

//Processos Seletivos
if (strcmp($type, "procsel") == 0)
	{
		$procSel = new ProcessoSeletivo();
		$data = $procSel->listProcSel();
		
		$smarty->assign("procSel", $data);
	}

//Show the page
$smarty->display('admin\index.tpl');