<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/FaseTeste.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/AlternativaQuestao.class.php';
include_once '../lib/TesteCandidato.class.php';

if (isset($_GET['action']))
	{
		$action = $_GET['action'];
	}

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
$smarty->assign("page", "teste");
$smarty->assign("action", $action);
$smarty->assign("status", $_GET['status']);
$smarty->assign("logado", $session->loggedIn);

//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());

if ($session->loggedIn)
	{
		if (isset($_GET['id']) && is_numeric($_GET['id']))
			{
				$cod = $_GET['id'];
				$smarty->assign("fase_cod", $cod);
				
				$fase = new Fases();
				$fase->setCodigo($cod);
				
				$testeCand = new TesteCandidato();
				$testeCand->setFase($fase);
				if (!$testeCand->searchByFase())
					{
						$faseTeste = new FaseTeste();
						$faseTeste->setFase($fase);
						$faseTeste->getTesteByFase();
						
						$smarty->assign("teste_cod", $faseTeste->getTeste()->getCodigo());
		
						$quest = new Questao();
						$quest->setTeste($faseTeste->getTeste());
						$questoes = $quest->listQuestoesByCodigo();
						
						$count = count($questoes);
						for ($i = 0; $i < $count; $i++)
							{
								$quest = new Questao();
								$quest->setCodigo($questoes[$i]['QUESTAO_COD']);
								
								$alt = new AlternativaQuestao();
								$alt->setQuestao($quest);
								$alts = $alt->listAlternativasByQuestao();
								
								$questoes[$i]['ALTERNATIVAS'] = $alts;
							}
							
						$smarty->assign("questoes", $questoes);
						$smarty->assign("status_teste", true);
					}
				else
					$smarty->assign("status_teste", false);
			}
	}
	
//Show the page
$smarty->display('teste\index.tpl');