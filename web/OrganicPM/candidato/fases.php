<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/TesteCandidato.class.php';
include_once '../lib/EntrevistaCandidato.class.php';
include_once '../lib/TriagemCandidato.class.php';
include_once '../lib/ProcessoSeletivo.class.php';

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
$smarty->assign("page", "fasesDetail");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);

//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());

if ($session->loggedIn)
	{
		if (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				
				if (is_numeric($cod))
					{
						$fases = new Fases();
						$fases->setCodigo($cod);
						$fases->getTipoFaseByCodigo();
						$tipoFase = $fases->getTipoFase();
						
						//Teste
						if ($tipoFase->getCodigo() == 1)
							{
								$testeCand = new TesteCandidato();
								$testeCand->setPessoa($pessoa);
								$testeCand->setFase($fases);
								
								$data = $testeCand->getDataByCodigo();
																
								$smarty->assign("fase", $data['FASE']);
								$smarty->assign("data_inicio", $data['DATA_INICIO']);
								$smarty->assign("data_fim", $data['DATA_FIM']);
								$smarty->assign("data", $data['DATA']);
								$smarty->assign("status", $data['STATUS']);
								$smarty->assign("nota", $data['NOTA']);
							}
						//Triagem
						elseif ($tipoFase->getCodigo() == 2)
							{
								$triagCand = new TriagemCandidato();
								$triagCand->setFase($fases);
								$triagCand->setPessoa($pessoa);
								
								$data = $triagCand->getDataByCodigo();
								
								$smarty->assign("fase", $data['FASE']);
								$smarty->assign("data_inicio", $data['DATA_INICIO']);
								$smarty->assign("data_fim", $data['DATA_FIM']);
								$smarty->assign("data", $data['DATA']);
								$smarty->assign("status", $data['STATUS']);
							}
						//Entrevista
						elseif ($tipoFase->getCodigo() == 3)
							{
								$fases->getProcessoSeletivoByCodigo();
								$procSel = $fases->getProcessoSeletivo();
								
								$entrevCand = new EntrevistaCandidato();
								$entrevCand->setPessoa($pessoa);
								$entrevCand->setFase($fases);
								$entrevCand->setProcessoSeletivo($procSel);
								
								$data = $entrevCand->getAllDataByCodigo();
																
								$smarty->assign("fase", $data['FASE']);
								$smarty->assign("data_inicio", $data['DATA_INICIO']);
								$smarty->assign("data_fim", $data['DATA_FIM']);
								$smarty->assign("data", $data['DATA_EFETIVA']);
								$smarty->assign("data_agendada", $data['DATA_AGENDADA']);
								$smarty->assign("status", $data['STATUS']);
							}
					}
				else
					$smarty->assign("fase_erro", true);
			}
		else
			header("Location: candidato/index.php");
	}

//Show the page
$smarty->display('index.tpl');