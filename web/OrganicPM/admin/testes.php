<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/TipoTeste.class.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/Teste.class.php';

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
$smarty->assign("page", "adminTestes");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());
$smarty->assign("url", "testes.php");

if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);

//Novo
if (strcmp($action, "novo") == 0)
	{
		$tipoTeste = new TipoTeste();
		$smarty->assign("listTiposTeste", $tipoTeste->listTiposTeste());
		
		$tipoQuestao = new TipoQuestao();
		$smarty->assign("listTiposQuestao", $tipoQuestao->listTiposQuestao());
	
		//Form values
		$smarty->assign("teste_descricao", $form->value("teste_descricao"));
		$smarty->assign("teste_tipo", $form->value("teste_tipo"));
		
		//Errors
		$smarty->assign("teste_descricao_erro", $form->error("teste_descricao"));
		$smarty->assign("teste_tipo_erro", $form->error("teste_tipo"));
		$smarty->assign("questoes_erro", $form->error("questoes"));
		$smarty->assign("teste_erro", $form->error("teste"));
		
		//Questões
		$questoes 		= array();
		$descricao		= $form->getArray("questao_descricao");
		$tipo			= $form->getArray("questao_tipo");
		$alternativas	= $form->getArray("questao_alternativas");
		$respostas		= $form->getArray("questao_respostas");
		
		$count = count($descricao);
		for ($i = 0; $i < $count; $i++)
			{
				$questoes[$i] = array('DESCRICAO' => $descricao[$i],
									 'TIP_QUE_COD' => $tipo[$i],
									 'ALTERNATIVAS' => $alternativas[$i],
									 'RESPOSTAS' => $respostas[$i],
									 'RESUMO' => substr($descricao[$i], 0, 20));
			}
					
		$smarty->assign("questoes", $questoes);
		
	}
	
//Listar
if (strcmp($action, "listar") == 0)
	{
		if (isset($_GET['page']))
			$smarty->assign("pageNumber", $_GET['page']);
			
		$teste = new Teste();
		$data = $teste->listTestesByPage();
			
		$columns = array(
						'Código',
						'Descrição',
						'Tipo'		
		);
				
		$smarty->assign("data", $data);
		$smarty->assign("columns", $columns);
		$smarty->assign("tableTitle", "Testes");
	}

//Show the page
$smarty->display('admin\index.tpl');