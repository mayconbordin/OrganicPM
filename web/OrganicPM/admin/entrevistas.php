<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/EntrevistaCandidato.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/EntrevistaCandidato.class.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/FlexiGrid/FlexiGrid.class.php';
include_once '../lib/Logs/ActionLog.class.php';

//ActionLog
$log = new ActionLog();
$log->recordAction("Acessou a página de entrevistas");

global $form, $session;

$actions = array("agendar", "registrar", "listar", "editar");

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
$smarty->assign("page", "entrevistas");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());
$smarty->assign("url", "entrevistas.php");

if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);

//Agendar
if (strcmp($action, "agendar") == 0)
	{
		if (isset($_GET['pid']) && isset($_GET['psid']) && isset($_GET['fid']))
			{
				if (is_numeric($_GET['pid']) && is_numeric($_GET['psid']) && is_numeric($_GET['fid']))
					{
						$pid 	= $_GET['pid'];
						$psid 	= $_GET['psid'];
						$fid 	= $_GET['fid'];
						
						$pessoa = new Pessoa();
						$pessoa->setCodigo($pid);
						
						$procSel = new ProcessoSeletivo();
						$procSel->setCodigo($psid);
						
						$fase = new Fases();
						$fase->setCodigo($fid);
						
						$entrevCand = new EntrevistaCandidato();
						$entrevCand->setPessoa($pessoa);
						$entrevCand->setProcessoSeletivo($procSel);
						$entrevCand->setFase($fase);
						
						$data = $entrevCand->getDataByCodigo();
						
						$smarty->assign("nome", $data['NOME']);
						$smarty->assign("descricao", $data['DESCRICAO']);
						$smarty->assign("data_inicio", $data['DATA_INICIO']);
						$smarty->assign("data_fim", $data['DATA_FIM']);
						
						$smarty->assign("pessoa_cod", $pid);
						$smarty->assign("pro_sel_cod", $psid);
						$smarty->assign("fase_cod", $fid);
						
						//Data agendada pré-definida
						if ($form->value("data_agendada"))
							$smarty->assign("data_agendada", $form->value("data_agendada"));
						else
							$smarty->assign("data_agendada", date('Y-m-d H:i:s'));
												
						$smarty->assign("listar", false);
						
						//Errors
						$smarty->assign("geral_erro", $form->error("geral"));
						$smarty->assign("data_agendada_erro", $form->error("data_agendada"));
						
						$log->recordAction("Acessou a página de agendamento de entrevistas");
					}
				else
					{
						header("Location: entrevistas.php");
						$log->recordAction("Informou valores inválidos para o agendamento de entrevistas");
					}
			}
		else
			{
				$smarty->assign("listar", true);
				
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
				
				$entrev = new EntrevistaCandidato();
				$data = $entrev->listEntrevistasParaAgendarByPage($start, ($start+$lenght));
				
				$count = count($data);
				$params = array();
				
				
				for ($i = 0; $i < $count; $i++)
					{
						$params[$i] = "&pid=".$data[$i][4]."&psid=".$data[$i][5]."&fid=".$data[$i][6];
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3]);
					}
									
				$count = $entrev->countParaAgendar();
				$pagination = new Pagination($page, $count, $lenght, 1, "entrevistas.php?action=agendar");
					
				$columns = array(
								'Candidato',
								'Processo Seletivo',
								'Data de Início (Fase)',
								'Data de Fim (Fase)'		
				);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Entrevistas para Agendar");
				$smarty->assign("pagination", $pagination->getPagenavi());
				$smarty->assign("params", $params);
				
				$smarty->assign("tableAction", "agendar");
				$smarty->assign("titleAction", "Agendar");
				
				$log->recordAction("Acessou a página de listagem de entrevistas para agendar");
			}
	}
	
//Registrar
if (strcmp($action, "registrar") == 0)
	{
		if (isset($_GET['pid']) && isset($_GET['psid']) && isset($_GET['fid']))
			{
				if (is_numeric($_GET['pid']) && is_numeric($_GET['psid']) && is_numeric($_GET['fid']))
					{
						$pid 	= $_GET['pid'];
						$psid 	= $_GET['psid'];
						$fid 	= $_GET['fid'];
						
						$pessoa = new Pessoa();
						$pessoa->setCodigo($pid);
						
						$procSel = new ProcessoSeletivo();
						$procSel->setCodigo($psid);
						
						$fase = new Fases();
						$fase->setCodigo($fid);
						
						$entrevCand = new EntrevistaCandidato();
						$entrevCand->setPessoa($pessoa);
						$entrevCand->setProcessoSeletivo($procSel);
						$entrevCand->setFase($fase);
						
						$data = $entrevCand->getDataByCodigo();

						$smarty->assign("nome", $data['NOME']);
						$smarty->assign("descricao", $data['DESCRICAO']);
						$smarty->assign("data_inicio", $data['DATA_INICIO']);
						$smarty->assign("data_fim", $data['DATA_FIM']);
						
						$smarty->assign("pessoa_cod", $pid);
						$smarty->assign("pro_sel_cod", $psid);
						$smarty->assign("fase_cod", $fid);
						$smarty->assign("data_agendada", $data['DATA_AGENDADA']);
						
						//Data agendada pré-definida
						if ($form->value("data_efetiva"))
							$smarty->assign("data_efetiva", $form->value("data_efetiva"));
						else
							$smarty->assign("data_efetiva", date('Y-m-d H:i:s'));
												
						$smarty->assign("listar", false);
						
						//Values
						$smarty->assign("entrevistador", $form->value("entrevistador"));
						$smarty->assign("comentario", $form->value("comentario"));
						$smarty->assign("status", $form->value("status"));
						
						//Errors
						$smarty->assign("geral_erro", $form->error("geral"));
						$smarty->assign("data_efetiva_erro", $form->error("data_efetiva"));
						$smarty->assign("entrevistador_erro", $form->error("entrevistador"));
						$smarty->assign("comentario_erro", $form->error("comentario"));
						$smarty->assign("status_erro", $form->error("status"));
						
						$log->recordAction("Acessou a página para o registro de entrevistas");
					}
				else
					{
						header("Location: entrevistas.php");
						$log->recordAction("Informou valores inválidos para o registro de entrevistas");
					}
			}
		else
			{
				$smarty->assign("listar", true);
				
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
				
				$entrev = new EntrevistaCandidato();
				$data = $entrev->listEntrevistasParaRegistrarByPage($start, ($start+$lenght));
				
				$count = count($data);
				$params = array();
				
				for ($i = 0; $i < $count; $i++)
					{
						$params[$i] = "&pid=".$data[$i][3]."&psid=".$data[$i][4]."&fid=".$data[$i][5];
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2]);
					}
				
				$count = $entrev->countParaAgendar();
				$pagination = new Pagination($page, $count, $lenght, 1, "entrevistas.php?action=registrar");
					
				$columns = array(
								'Candidato',
								'Processo Seletivo',
								'Data Agendada'
				);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Entrevistas para Registrar");
				$smarty->assign("pagination", $pagination->getPagenavi());
				$smarty->assign("params", $params);
				
				$smarty->assign("tableAction", "registrar");
				$smarty->assign("titleAction", "Registrar");
				
				$log->recordAction("Acessou a página para listagem de entrevistas para registrar");
			}
	}
	
//Listar
if (strcmp($action, "listar") == 0)
	{
		$entrevCand = new EntrevistaCandidato();
		
		//FlexiGrid
		$flex = new FlexiGrid($entrevCand);
		$flex->setTitle("Entrevistas");
		$flex->setUrl("entrevistaFunc.php");
		$flex->setEdit(array('caption' => 'Editar', 'url' => 'entrevistas.php?action=editar'));
		$flex->setAddBtn('false');
		$flex->setDelBtn('false');
			 
		$smarty->assign("flexigrid", $flex->generateConfig());
		
		$log->recordAction("Acessou a página para listagem de entrevistas");
	}
	
//Editar
if (strcmp($action, "editar") == 0)
	{
		if (isset($_GET['pid']) && is_numeric($_GET['pid'])
		&& isset($_GET['psid']) && is_numeric($_GET['psid'])
		&& isset($_GET['fid']) && is_numeric($_GET['fid']))
			{
				$pid 	= $_GET['pid'];
				$psid 	= $_GET['psid'];
				$fid 	= $_GET['fid'];
				
				$pessoa = new Pessoa();
				$pessoa->setCodigo($pid);
				
				$procSel = new ProcessoSeletivo();
				$procSel->setCodigo($psid);
				
				$fase = new Fases();
				$fase->setCodigo($fid);
				
				$entrevCand = new EntrevistaCandidato();
				$entrevCand->setPessoa($pessoa);
				$entrevCand->setProcessoSeletivo($procSel);
				$entrevCand->setFase($fase);
				
				$data = $entrevCand->getAllDataByCodigo();
				
				//Values
				$smarty->assign("pessoa_cod", $pid);
				$smarty->assign("pro_sel_cod", $psid);
				$smarty->assign("fase_cod", $fid);
				
				$smarty->assign("nome", $data['NOME']);
				$smarty->assign("descricao", $data['DESCRICAO']);
				$smarty->assign("data_inicio", $data['DATA_INICIO']);
				$smarty->assign("data_fim", $data['DATA_FIM']);
				$smarty->assign("data_efetiva", $data['DATA_EFETIVA']);
				$smarty->assign("data_agendada", $data['DATA_AGENDADA']);
				$smarty->assign("entrevistador", $data['ENTREVISTADOR']);
				$smarty->assign("comentario", $data['COMENTARIO']);
				$smarty->assign("status_entrev", $data['STATUS']);
				
				//Errors
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("data_efetiva_erro", $form->error("data_efetiva"));
				$smarty->assign("data_agendada_erro", $form->error("data_agendada"));
				$smarty->assign("entrevistador_erro", $form->error("entrevistador"));
				$smarty->assign("comentario_erro", $form->error("comentario"));
				$smarty->assign("status_erro", $form->error("status"));
				
				$log->recordAction("Acessou a página de edição de entrevistas entrevistas");
			}
		else
			{
				header("Location: entrevistas.php");
				$log->recordAction("Informou valores inválidos para a edição de entrevistas");
			}
	}

//Show the page
$smarty->display('admin\index.tpl');