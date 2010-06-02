<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Cargo.class.php';
include_once '../lib/TipoFase.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/ProcessoSeletivo.class.php';

global $form, $session;

$actions = array("novo", "listar", "pesquisar", "editar");

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
		$teste			= $form->getArray("teste");
		$dataInicio		= $form->getArray("fase_data_inicio");
		$dataFim		= $form->getArray("fase_data_fim");
		
		$count = count($tipo);
		for ($i = 1; $i < $count; $i++)
			{
				$tipoFase = new TipoFase();
				$tipoFase->setCodigo($tipo[$i]);
				$tipoFase->getFaseByCodigo();
				
				$fases[$i-1] = array('FASE_TIPO' => $tipo[$i],
									 'FASE_NOME' => $tipoFase->getFase(),
									 'TESTE' => $teste[$i],
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
		$data = $procSel->listProcSelByPage();
		
		$columns = array(
						'C�digo',
						'Descri��o',
						'Data de In�cio',
						'Data de Fim',
						'Vagas',
						'Cargo'		
		);
				
		$smarty->assign("data", $data);
		$smarty->assign("columns", $columns);
		$smarty->assign("tableTitle", "Processos Seletivos");
	}

//Show the page
$smarty->display('admin\index.tpl');