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
include_once '../lib/CandidatoProcessoSeletivo.class.php';

include_once '../plugins/compareDates.function.php';
include_once '../lib/FlexiGrid/FlexiGrid.class.php';

global $form, $session;

$actions = array("novo", "listar", "editar", "inscritos");

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
$smarty->assign("page", "adminProcSel");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());

if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);

//Novo
if (strcmp($action, "novo") == 0)
	{
		$cargo = new Cargo();
		$smarty->assign("listCargos", $cargo->listCargos());
		
		$tipoFase = new TipoFase();
		$smarty->assign("listTiposFase", $tipoFase->listTiposFase());

		//Form values
		$smarty->assign("descricao", $form->value("descricao"));
		$smarty->assign("data_inicio", $form->value("data_inicio"));
		$smarty->assign("data_fim", $form->value("data_fim"));
		$smarty->assign("vagas", $form->value("vagas"));
		$smarty->assign("cargo", $form->value("cargo"));
		
		//Fases
		$fases	 		= array();
		$tipo 			= $form->getArray("fase_tipo");
		$dataInicio		= $form->getArray("fase_data_inicio");
		$dataFim		= $form->getArray("fase_data_fim");
		
		$count = count($tipo);
		for ($i = 1; $i < $count; $i++)
			{
				if (strpos($tipo[$i], '-') !== false)
					{
						$data = explode('-', $tipo[$i]);
		   				$tipo[$i] = $data[0];
		   				$teste = $data[1];
		   				$nota = $data[2];
					}
				else
					{
						$teste = '';
						$nota = '';
					}
				
				$tipoFase = new TipoFase();
				$tipoFase->setCodigo($tipo[$i]);
				$tipoFase->getFaseByCodigo();
				
				$fases[$i-1] = array('FASE_TIPO' => $tipo[$i],
									 'FASE_NOME' => $tipoFase->getFase(),
									 'TESTE' => $teste,
									 'NOTA' => $nota,
									 'FASE_DATA_INICIO' => $dataInicio[$i],
									 'FASE_DATA_FIM' => $dataFim[$i]);
			}
					
		$smarty->assign("fases", $fases);
		
		//Errors
		$smarty->assign("descricao_erro", $form->error("descricao"));
		$smarty->assign("data_inicio_erro", $form->error("data_inicio"));
		$smarty->assign("data_fim_erro", $form->error("data_fim"));
		$smarty->assign("vagas_erro", $form->error("vagas"));
		$smarty->assign("cargo_erro", $form->error("cargo"));
		$smarty->assign("processo_seletivo_erro", $form->error("processo_seletivo"));
		$smarty->assign("fase_erro", $form->error("fase"));
	}

//Listar
if (strcmp($action, "listar") == 0)
	{
		$procSel = new ProcessoSeletivo();
		
		//FlexiGrid
		$flex = new FlexiGrid($procSel);
		$flex->setTitle("Processos Seletivos");
		$flex->setUrl("procSelFunctions.php");
		$flex->setEdit(array('caption' => 'Editar', 'url' => 'procseletivo.php?action=editar&id='));
		$flex->setAdd(array('caption' => 'Novo', 'url' => 'procseletivo.php?action=add'));
			 
		$smarty->assign("flexigrid", $flex->generateConfig());
	}
	
//Inscritos
if (strcmp($action, "inscritos") == 0)
	{
		if (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				
				if (is_numeric($cod))
					{
						$procSel = new ProcessoSeletivo();
						$procSel->setCodigo($cod);
						
						$candProcSel = new CandidatoProcessoSeletivo();
						$candProcSel->setProcessoSeletivo($procSel);
		
						//FlexiGrid
						$flex = new FlexiGrid($candProcSel);
						$flex->setTitle("Candidatos Inscritos");
						$flex->setUrl("candProcSelFunctions.php?id=".$cod);
						$flex->setAddBtn('false');
						$flex->setEdtBtn('false');
						$flex->setDelBtn('false');
							 
						$smarty->assign("flexigrid", $flex->generateConfig());
					}
				else
					header("Location: procseletivo.php");
			}
		else
			{
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
				$data = $procSel->listProcSelByPage($start, ($start+$lenght));
				
				$count = count($data);
				$params = array();
				
				for ($i = 0; $i < $count; $i++)
					{
						$params[$i] = "&id=".$data[$i][0];
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3], $data[$i][4], $data[$i][5]);
					}
				
				$count = $procSel->count();
				$pagination = new Pagination($page, $count, $lenght, 1, "procseletivo.php?action=inscritos");
					
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
				$smarty->assign("tableTitle", "Processos Seletivos");
				$smarty->assign("pagination", $pagination->getPagenavi());
				$smarty->assign("params", $params);
				
				$smarty->assign("tableAction", "inscritos");
				$smarty->assign("titleAction", "Candidatos Inscritos");
			}
	}
	
//Editar
if (strcmp($action, "editar") == 0)
	{
		if (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				
				if (is_numeric($cod))
					$smarty->assign("pro_sel_cod", $cod);
				else
					header("Location: procseletivo.php");
			}
		
		$procSel = new ProcessoSeletivo();
		$procSel->setCodigo($cod);
		$data = $procSel->getDataByCodigo();
		
		$smarty->assign("descricao", $data['DESCRICAO']);
		$smarty->assign("data_inicio", $data['DATA_INICIO']);
		$smarty->assign("data_fim", $data['DATA_FIM']);
		$smarty->assign("vagas", $data['VAGAS']);
		$smarty->assign("cargo", $data['CARGO_COD']);
		
		$cargo = new Cargo();
		$smarty->assign("listCargos", $cargo->listCargos());
		
		
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
		
		$fases = new Fases();
		$fases->setProcessoSeletivo($procSel);
		$data = $fases->listFasesByProcSel($start, ($start+$lenght));
		$count = $fases->countByProcSel();
		
		$pagination = new Pagination($page, $count, $lenght, 1, "procseletivo.php?action=editar&id=".$cod);
		
		$count = count($data);
		for ($i = 0; $i < $count; $i++)
			{
				$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3], $data[$i][4], $data[$i][5], $data[$i][6]);
			}
			
		$columns = array(
						'Código',
						'Ordem',
						'Data de Início',
						'Data de Fim',
						'Status',
						'Cargo',
						'Tipo de Fase'
		);
				
		$smarty->assign("data", $data);
		$smarty->assign("columns", $columns);
		$smarty->assign("tableTitle", "Fases do Processo Seletivo");
		$smarty->assign("pagination", $pagination->getPagenavi());
		$smarty->assign("url", "fase.php");
		
		//Errors
		$smarty->assign("descricao_erro", $form->error("descricao"));
		$smarty->assign("data_inicio_erro", $form->error("data_inicio"));
		$smarty->assign("data_fim_erro", $form->error("data_fim"));
		$smarty->assign("vagas_erro", $form->error("vagas"));
		$smarty->assign("cargo_erro", $form->error("cargo"));
		$smarty->assign("geral_erro", $form->error("geral"));
	}

//Show the page
$smarty->display('admin\index.tpl');