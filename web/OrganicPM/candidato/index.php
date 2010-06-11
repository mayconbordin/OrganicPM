<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/TesteCandidato.class.php';

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
$smarty->assign("page", "content");

$smarty->assign("logado", $session->loggedIn);
$smarty->assign("userID", $session->user->getId());

//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());

if ($session->loggedIn)
	{
		//Tabela de vagas
		$procSel = new ProcessoSeletivo();
		$data = $procSel->listProcSelAtivosByPage(0, 3);
		$smarty->assign("vagas", $data);
		
		//Tabela de fases pendentes
		$fases = new Fases();
		$fases->setPessoa($pessoa);
		$data = $fases->listFasesByPageAndPessoa(0, 3);
		$fasesAtivas = array();
		$fasesFinalizadas = array();
		
		foreach ($data as $fas)
			{
				if (stripos($fas[6], "teste") !== false)
					{
						$fase = new Fases();
						$fase->setCodigo($fas[0]);
						$testeCand = new TesteCandidato();
						$testeCand->setFase($fase);
						
						//Fases ativas que precisam ser executadas
						if (!$testeCand->searchByFase())
							$fasesAtivas[] = $fas;
						//Fases finalizadas
						else
							$fasesFinalizadas[] = $fas;
						
					}
					
				//Fazer o mesmo com triagens e entrevistas
			}
		
		$smarty->assign("fases", $fasesAtivas);
		
		//Tabela de status de processos seletivos
		$procSel = new ProcessoSeletivo();
		$procSel->setPessoa($pessoa);
		$data = $procSel->listProcSelByPageAndPessoa(0, 3);		
		$smarty->assign("processos", $data);
	}

//Show the page
$smarty->display('index.tpl');